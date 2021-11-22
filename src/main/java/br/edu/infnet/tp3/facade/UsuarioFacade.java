package br.edu.infnet.tp3.facade;

import br.edu.infnet.tp3.model.Endereco;
import br.edu.infnet.tp3.model.Usuario;
import br.edu.infnet.tp3.repository.EnderecoRepository;
import br.edu.infnet.tp3.repository.UsuarioRepository;
import br.edu.infnet.tp3.service.AmazonClientService;
import br.edu.infnet.tp3.service.ViaCepService;
import br.edu.infnet.tp3.service.dto.EnderecoViaCep;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Base64;

@Service
public class UsuarioFacade {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private EnderecoRepository enderecoRepository;
    @Autowired
    private ViaCepService viaCepService;

    @Autowired
    private AmazonClientService amazonClientService;

    private EnderecoViaCep enderecoViaCep;

    public String pegarCep(Model model, String cep){
        enderecoViaCep = viaCepService.buscarEnderecoPor(cep);
        model.addAttribute("endereco", enderecoViaCep);
        return "/usuario";

    }
    public String pegarCepAlterar(Model model, String cep){
        enderecoViaCep = viaCepService.buscarEnderecoPor(cep);
        model.addAttribute("endereco", enderecoViaCep);
        return "/alteracao";
    }

    public String salvar(Usuario usuario, Endereco endereco, MultipartFile file) {
        usuario.setNomeArquivo(file.getOriginalFilename());
        amazonClientService.save(file);
        usuario.setEndereco(endereco);
        enderecoRepository.save(endereco);
        usuarioRepository.save(usuario);
        return "index";
    }

    public String listar(Model model){
        model.addAttribute("usuarios",usuarioRepository.findAll());
        return "listagem";
    }
    public String pesquisar(Model model, String email){
        model.addAttribute("usuario",usuarioRepository.resgatar(email));
        return "pesquisa";
    }

    public String resgatardados(Model model,String email){
        Usuario usuario =  usuarioRepository.resgatar(email);
        model.addAttribute("usuario",usuario);
        return "alteracao";
    }

    public String alterar(Usuario usuario, Endereco endereco, MultipartFile file){
        Usuario usuarioDados =  usuarioRepository.findById(usuario.getId()).orElse(null);
        Endereco enderecoDados = enderecoRepository.findById(endereco.getId()).orElse(null);
        if(file.getOriginalFilename()!= null && usuarioDados.getNomeArquivo()!=null) {
            amazonClientService.delete(usuarioDados.getNomeArquivo());
            usuarioDados.setNomeArquivo(file.getOriginalFilename());
            amazonClientService.save(file);
        }
        if(file.getOriginalFilename()!= null && usuario.getNomeArquivo()==null) {
            usuarioDados.setNomeArquivo(file.getOriginalFilename());
            amazonClientService.save(file);
        }
        if(usuarioDados.equals(usuario)){
            enderecoDados.setBairro(endereco.getBairro());
            enderecoDados.setCep(endereco.getCep());
            enderecoDados.setLocalidade(endereco.getLocalidade());
            enderecoDados.setComplemento(endereco.getComplemento());
            enderecoDados.setLogradouro(endereco.getLogradouro());
            enderecoDados.setNumero(endereco.getNumero());
            enderecoDados.setUf(endereco.getUf());
            usuarioDados.setNome(usuario.getNome());
            usuarioDados.setEmail(usuario.getEmail());
            usuarioDados.setTelefone(usuario.getTelefone());
            usuarioDados.setEndereco(enderecoDados);
            usuarioRepository.save(usuarioDados);
            return "index";
        }
        usuario.setEndereco(endereco);
        usuarioRepository.save(usuario);
        return "index";
    }

    public String perfil(Model model, String email) throws IOException {

        Usuario usuario = usuarioRepository.resgatar(email);
        String nomeImagem = usuario.getNomeArquivo();
        if(nomeImagem != null){
            File file = amazonClientService.download(nomeImagem);
            byte[] bytes = Files.readAllBytes(file.toPath());

            String imagemPronta = Base64.getEncoder().encodeToString(bytes);
            model.addAttribute("imagem", imagemPronta);

        }


        model.addAttribute("usuario", usuario);

        return "perfil";
    }



}
