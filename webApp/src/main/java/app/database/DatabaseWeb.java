package app.database;

import app.model.Fornecedor;

import java.util.HashMap;
import java.util.Map;

public class DatabaseWeb {
    private static Map<String,Fornecedor> fornecedores = new HashMap<String, Fornecedor>();

    public static Map<String,Fornecedor> getFornecedores(){return fornecedores;};
}
