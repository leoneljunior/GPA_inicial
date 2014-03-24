package br.ufc.quixada.npi.controller;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.ufc.quixada.npi.model.Contato;
import br.ufc.quixada.npi.service.ContatoService;

@Named
@RequestMapping("/")
public class ContatoController {
	@Inject
	private ContatoService cs;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String listarContatos(ModelMap model) {
		model.addAttribute("contatos", cs.findAll());
		return "contato/listar_contatos";
	}

	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public String hello(ModelMap model) {
		model.addAttribute("nome", "João");
		return "contato/ola";
	}
	
	@RequestMapping(value = "/inserirContato", method = RequestMethod.GET)
	public String redInserir(){
		return "contato/inserir";
	}
	
	@RequestMapping(value = "/inserirContato", method = RequestMethod.GET)
	public String inserirContato(Contato contato) {
		cs.insere(contato);
		return "contato/listar_contatos";
	}

}
