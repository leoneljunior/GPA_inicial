package br.ufc.quixada.npi.service;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.transaction.annotation.Transactional;

import br.ufc.quixada.npi.model.Contato;
import br.ufc.quixada.npi.repository.ContatoRepository;

@Named
public class ContatoServiceImpl implements ContatoService {

	@Inject
	private ContatoRepository contatoRepository;

	public ContatoServiceImpl() {
	}

	@Transactional
	public void insere(Contato contato) {
		System.out.println("Verificação service:"+contato.getNome() +" - " + contato.getFone());
		contatoRepository.save(contato);

	}

	@Transactional
	public List<Contato> findAll() {
		List<Contato> l = contatoRepository.find();
		return l;
	}

}
