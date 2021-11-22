package br.edu.infnet.tp3.controller;

import br.edu.infnet.tp3.facade.UsuarioFacade;
import br.edu.infnet.tp3.model.Endereco;
import br.edu.infnet.tp3.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@RequestMapping("usuario")
public class UsuarioController {

	@Autowired
	private UsuarioFacade usuarioFacade;


	@GetMapping("/")
	public String telaIndex() {
		return "index";
	}

	@GetMapping("/cep")
	private String telaCep(){
		return "cep";
	}
	@PostMapping("/cep")
	public String pegarCep(Model model, String cep){
		return usuarioFacade.pegarCep(model, cep);
	}


	@PostMapping(value = "/cadastrar")
	public String salvar(Usuario usuario, Endereco endereco,@RequestPart("imagem") MultipartFile file) {
		return usuarioFacade.salvar(usuario, endereco, file);
	}


	@GetMapping("/listar")
	public String listar(Model model){
		return usuarioFacade.listar(model);
	}
	@GetMapping("/pesquisar")
	public String pesquisar(Model model, @RequestParam("email") String email){
		return usuarioFacade.pesquisar(model, email);
	}
	@GetMapping("/resgatardados")
	public String resgatarDados(Model model, @RequestParam("email") String email){
		return usuarioFacade.resgatardados(model, email);
	}

	@PostMapping("/alterar")
	public String alterar(Usuario usuario, Endereco endereco, @RequestPart("imagem") MultipartFile file){
		return usuarioFacade.alterar(usuario, endereco, file);
	}

	@GetMapping("/perfil")
	public String perfil(Model model, String email) throws IOException {
		return usuarioFacade.perfil(model, email);
	}









}
