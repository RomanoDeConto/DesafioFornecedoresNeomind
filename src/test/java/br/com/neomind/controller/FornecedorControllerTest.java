package br.com.neomind.controller;

import br.com.neomind.database.DatabaseWeb;
import br.com.neomind.model.Fornecedor;
import br.com.neomind.service.FornecedorService;
import org.junit.Assert;
import org.junit.Test;

import java.util.Map;

public class FornecedorControllerTest {
    Map<Integer, Fornecedor> listaFornecedores = DatabaseWeb.getFornecedores();
    FornecedorService service = new FornecedorService();

    @Test
    public void createShouldPersistData(){
        Fornecedor fornecedor = new Fornecedor();
        fornecedor.setId(2);
        fornecedor.setName("Teste");
        fornecedor.setEmail("teste@teste");
        fornecedor.setComment("coment");
        fornecedor.setCnpj("1209012");
        listaFornecedores.put(2,fornecedor);

        Fornecedor fornecedor3 = new Fornecedor();
        fornecedor3.setId(1);
        fornecedor3.setName("Teste");
        fornecedor3.setEmail("teste@teste");
        fornecedor3.setComment("coment");
        fornecedor3.setCnpj("23123123");

        Assert.assertEquals(listaFornecedores.get(2),fornecedor);
    }

    @Test
    public void findByIdShouldPersistData(){
        Fornecedor fornecedor = new Fornecedor();
        fornecedor.setId(2);
        fornecedor.setName("Teste");
        fornecedor.setEmail("teste@teste");
        fornecedor.setComment("coment");
        fornecedor.setCnpj("1209012");
        listaFornecedores.put(2,fornecedor);

        Assert.assertEquals(service.obterFornecedor(2),fornecedor);
    }

    @Test
    public void findAllShouldPersistData(){

        Fornecedor fornecedor = new Fornecedor();
        fornecedor.setId(2);
        fornecedor.setName("Teste");
        fornecedor.setEmail("teste@teste");
        fornecedor.setComment("coment");
        fornecedor.setCnpj("1209012");
        listaFornecedores.put(1,fornecedor);

        fornecedor.setId(2);
        fornecedor.setName("Teste2");
        fornecedor.setEmail("teste@teste");
        fornecedor.setComment("coment");
        fornecedor.setCnpj("1209012");
        listaFornecedores.put(2,fornecedor);

        Assert.assertEquals(service.obterFornecedores().size(),2);
    }

    @Test
    public void updateShouldChangeAndPersistData(){
        Fornecedor fornecedor = new Fornecedor();
        fornecedor.setId(1);
        fornecedor.setName("Teste");
        fornecedor.setEmail("teste@teste");
        fornecedor.setComment("coment");
        fornecedor.setCnpj("1209012");
        listaFornecedores.put(1,fornecedor);

        fornecedor.setName("Teste2");
        fornecedor.setEmail("teste2@teste");
        fornecedor.setComment("coment2");
        fornecedor.setCnpj("1209012");
        Assert.assertEquals(service.atualizarFornecedor(1,fornecedor).getId(),1);
        Assert.assertEquals(service.atualizarFornecedor(1,fornecedor).getName(),"Teste2");
        Assert.assertEquals(service.atualizarFornecedor(1,fornecedor).getEmail(),"teste2@teste");
        Assert.assertEquals(service.atualizarFornecedor(1,fornecedor).getComment(),"coment2");
        Assert.assertEquals(service.atualizarFornecedor(1,fornecedor).getCnpj(),"1209012");
    }

    @Test
    public void deleteShouldRemoveData(){
        Fornecedor fornecedor = new Fornecedor();
        fornecedor.setId(1);
        fornecedor.setName("Teste");
        fornecedor.setEmail("teste@teste");
        fornecedor.setComment("coment");
        fornecedor.setCnpj("1209012");
        listaFornecedores.put(1,fornecedor);
        service.deletarFornecedor(1);

        Assert.assertEquals(listaFornecedores.get(1),null);
    }

    @Test
    public void searchCnpjWithIdDifferentIdShouldPersisteData(){
        Fornecedor fornecedor = new Fornecedor();
        fornecedor.setId(1);
        fornecedor.setName("Teste");
        fornecedor.setEmail("teste@teste");
        fornecedor.setComment("coment");
        fornecedor.setCnpj("1209012");
        listaFornecedores.put(1,fornecedor);

        Fornecedor fornecedor2 = new Fornecedor();
        fornecedor2.setId(2);
        fornecedor2.setName("Teste");
        fornecedor2.setEmail("teste@teste");
        fornecedor2.setComment("coment");
        fornecedor2.setCnpj("1209012");


        Fornecedor fornecedor3 = new Fornecedor();
        fornecedor3.setId(1);
        fornecedor3.setName("Teste");
        fornecedor3.setEmail("teste@teste");
        fornecedor3.setComment("coment");
        fornecedor3.setCnpj("23123123");

        Assert.assertEquals(service.buscaCnpj(fornecedor),false);
        Assert.assertEquals(service.buscaCnpj(fornecedor3),false);
        Assert.assertEquals(service.buscaCnpj(fornecedor2),true);
    }
}
