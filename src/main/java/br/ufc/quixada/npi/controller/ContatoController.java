package br.ufc.quixada.npi.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;
import javax.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.quixada.npi.model.Contato;
import br.ufc.quixada.npi.service.ContatoService;

@Named
@RequestMapping("/")
@SessionAttributes(types = Contato.class)
public class ContatoController {
	@Inject
	private ContatoService cs;

	@InitBinder
	public void setAllowedFields(WebDataBinder dataBinder) {
		dataBinder.setDisallowedFields("id");
	}

	@RequestMapping(value = "/contato/new", method = RequestMethod.GET)
	public String initCreationForm(Map<String, Object> model) {
		Contato contato = new Contato();
		model.put("contato", contato);
		return "contato/createOrUpdateOwnerForm";
	}

	@RequestMapping(value = "/contato/new", method = RequestMethod.POST)
	public String processCreationForm(@Valid Contato contato,
			BindingResult result, SessionStatus status) {
		if (result.hasErrors()) {
			return "contato/createOrUpdateOwnerForm";
		} else {
			this.cs.salvar(contato);
			status.setComplete();
			return "redirect:/contatos/" + contato.getId();
		}
	}

	@RequestMapping(value = "/contato/{contatoId}/edite", method = RequestMethod.GET)
	public String initUpdateOwnerForm(@PathVariable("contatoId") int contatoId,
			Model model) {
		Contato contato = this.cs.findById(contatoId);
		model.addAttribute(contato);
		return "contato/createOrUpdateOwnerForm";
	}

	@RequestMapping(value = "/contato/{contatoId}/edite", method = RequestMethod.PUT)
	public String processUpdateOwnerForm(@Valid Contato contato,
			BindingResult result, SessionStatus status) {
		if (result.hasErrors()) {
			return "contato/createOrUpdateOwnerForm";
		} else {
			this.cs.salvar(contato);
			status.setComplete();
			return "redirect:/contato/{ownerId}";
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
		mav.addObject(this.cs.findById(contatoId));
		return mav;
	}

	/* Metodos antigos */

	// Metodos inserir antigos
	@RequestMapping(value = "/contato/inserir", method = RequestMethod.GET)
	public String redInserir() {
		return "contato/inserir";
	}

	@RequestMapping(value = "contato/inserirContato", method = RequestMethod.POST)
	public String inserirContato(Contato contato, RedirectAttributes ra) {

		try {
			cs.salvar(contato);
		} catch (Exception e) {
			System.out.println("Não inseriu...");
		}
		;
		ra.addFlashAttribute("msg", "Contato inserido com sucesso.");
		return "redirect:/";
	}

}
