package br.com.neomind.service;

import br.com.neomind.database.DatabaseWeb;
import br.com.neomind.model.Fornecedor;

import java.util.ArrayList;
import java.util.Map;

public class FornecedorService {
    private  Map<Integer, Fornecedor> fornecedores = DatabaseWeb.getFornecedores();

    public  Fornecedor obterFornecedor(int id){
        return fornecedores.get(id);
    }
    public  ArrayList<Fornecedor> obterFornecedores(){
        return new ArrayList<Fornecedor>(fornecedores.values());
    }

    public  Fornecedor adicionarFornecedor(Fornecedor novoFornecedor){
        if(fornecedores.containsKey(novoFornecedor.getId()) || buscaCnpj(novoFornecedor))
        {
            return null;
        }
        else{
            fornecedores.put(novoFornecedor.getId(),novoFornecedor);
            return novoFornecedor;
        }
    }

    public  Fornecedor atualizarFornecedor(int id, Fornecedor updateFornecedor){
        if(fornecedores.containsKey(id) && !buscaCnpj(updateFornecedor))
        {
            fornecedores.put(id,updateFornecedor);
            return updateFornecedor;
        }
        return null;
    }

    public  void deletarFornecedor(int id){
        fornecedores.remove(id);
    }

    public  boolean buscaCnpj(Fornecedor fornecedor)
    {
        ArrayList<Fornecedor> fornecedoresArray = new ArrayList<Fornecedor>(fornecedores.values());
        boolean valor = false;
        for (Fornecedor fornece:fornecedoresArray) {
            if(fornece.getCnpj().equals(fornecedor.getCnpj())&& !(fornece.getId() == fornecedor.getId()))
            {
                valor = true;
            }
        }
        return valor;
    }



}
