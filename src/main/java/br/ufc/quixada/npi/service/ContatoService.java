package br.ufc.quixada.npi.service;

import java.util.List;

import br.ufc.quixada.npi.model.Contato;

public interface ContatoService {

	public abstract void salvar(Contato contato);

	public Contato findById(int id);

	public abstract List<Contato> findAll();

}