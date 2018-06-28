package br.com.neomind.database;


import br.com.neomind.model.Fornecedor;

import java.util.HashMap;
import java.util.Map;

public class DatabaseWeb {
    private static Map<Integer,Fornecedor> fornecedores = new HashMap<Integer, Fornecedor>();

    public static Map<Integer,Fornecedor> getFornecedores(){return fornecedores;};
}
