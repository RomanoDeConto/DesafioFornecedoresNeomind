package br.com.neomind.controller;

import br.com.neomind.model.Fornecedor;
import br.com.neomind.service.FornecedorService;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/fornecedor")
@Consumes({MediaType.APPLICATION_JSON})
@Produces({MediaType.APPLICATION_JSON})
public class FornecedorController {
    FornecedorService fornecedorService = new FornecedorService();

    @GET
    public List<Fornecedor> getFornecedores() {
        return fornecedorService.obterFornecedores();
    }

    @POST
    public Fornecedor addFornecedor(Fornecedor novoFornecedor) {

        return fornecedorService.adicionarFornecedor(novoFornecedor);
    }

    @GET
    @Path("{id}")
    public Fornecedor getFornecedor(@PathParam("id") int id){
        return fornecedorService.obterFornecedor(id);
    }

    @PUT
    @Path("/{id}")
    public Fornecedor updateFornecedor(@PathParam("id")int id, Fornecedor updateFornecedor){
        return fornecedorService.atualizarFornecedor(id,updateFornecedor);
    }

    @DELETE
    @Path("/{id}")
    public void deleteFornecedor(@PathParam("id") int id){
        fornecedorService.deletarFornecedor(id);
    }
}
