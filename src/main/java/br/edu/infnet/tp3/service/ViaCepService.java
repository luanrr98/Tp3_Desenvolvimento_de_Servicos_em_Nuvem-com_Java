package br.edu.infnet.tp3.service;

import org.springframework.cloud.openfeign.FeignClient;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import br.edu.infnet.tp3.service.dto.EnderecoViaCep;

@FeignClient(url = "https://viacep.com.br/ws", name = "viaCepService")
public interface ViaCepService {

		    @GetMapping("{cep}/json")
		    EnderecoViaCep buscarEnderecoPor(@PathVariable("cep") String cep);

}
