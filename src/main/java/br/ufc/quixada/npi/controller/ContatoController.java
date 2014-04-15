package br.ufc.quixada.npi.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;
import javax.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.ResponseBody;
=======
>>>>>>> 6a50fb10631bf6b10fd388544a7edae82d41cf8b
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import br.ufc.quixada.npi.model.Contato;
import br.ufc.quixada.npi.service.ContatoService;

@Named
@RequestMapping("/")
public class ContatoController {
	@Inject
	private ContatoService cs;

	@RequestMapping(value="contatos/{contatoId}", method = RequestMethod.GET)
	public @ResponseBody Contato getContatoJson(@PathVariable("contatoId") int contatoId) {
 
		return this.cs.findById(contatoId);
 
	}

	@RequestMapping(value = "/contato/new", method = RequestMethod.GET)
	public String initCreationForm(Map<String, Object> model) {
		Contato contato = new Contato();
		model.put("contato", contato);
		return "contato/createOrUpdateOwnerForm";
	}

	@RequestMapping(value = "/contatos", method = RequestMethod.POST)
	public String processCreationForm(@Valid Contato contato,
			BindingResult result, SessionStatus status) {
		if (result.hasErrors()) {
			return "contatos";
		} else {
			this.cs.salvar(contato);
			status.setComplete();
			return "redirect:/contatos/";
		}
	}

	@RequestMapping(value = "/contatos/{contatoId}/edit", method = RequestMethod.GET)
	public String initUpdateOwnerForm(@PathVariable("contatoId") int contatoId,
			Model model) {
		System.out.println("Entrou no método");
		Contato contato = this.cs.findById(contatoId);
		model.addAttribute(contato);
		return "contato/createOrUpdateOwnerForm";
	}

	
	
	@RequestMapping(value = "/contatos/{contatoId}/edit", method = RequestMethod.PUT)
	public String processUpdateOwnerForm(@Valid Contato contato,
			BindingResult result, SessionStatus status) {
	
		if (result.hasErrors()) {
			return "contatos/createOrUpdateOwnerForm";
		} else {
			//contato.setId(contatoId);
			System.out.println("Entrou no método 2, id:" +contato.getId() );
			//contato.setId(Integer.parseInt("{contatoId}"));
			this.cs.salvar(contato);
			status.setComplete();
			return "redirect:/contatos/{contatoId}";
		}
	}

	/* Novo metodo Listar Funcionando pela metade */

	@RequestMapping(value = "/contatos", method = RequestMethod.GET)
	public String listaContatos(Contato contato, BindingResult result,
			Map<String, Object> model) {

		// allow parameterless GET request for /owners to return all records
		if (contato.getNome() == null) {
			contato.setNome(""); // empty string signifies broadest possible
									// search
		}

		// find owners by last name
		List<Contato> results = cs.findAll();
		if (results.size() < 1) {
			// no owners found
			result.rejectValue("lastName", "notFound", "not found");
			return "owners/findOwners";
		}
		if (results.size() > 1) {
			// multiple owners found
			model.put("selections", results);
			return "contato/contatosList";
		} else {
			// 1 owner found
			contato = results.iterator().next();
			return "redirect:/contatos/";
		}
	}

	@RequestMapping("/contatos/{contatoId}")
	public ModelAndView detalharContato(@PathVariable("contatoId") int contatoId) {
		ModelAndView mav = new ModelAndView("/contato/contatoDetails");
		System.out.println("Entrou no método 2, id:" +contatoId );
		mav.addObject(this.cs.findById(contatoId));
		return mav;
	}

}
