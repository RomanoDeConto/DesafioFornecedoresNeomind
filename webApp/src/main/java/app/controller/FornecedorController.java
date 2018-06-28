package app.controller;

import app.database.DatabaseWeb;
import app.model.Fornecedor;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Path("/fornecedor")
public class FornecedorController {
    private Map<String, Fornecedor> fornecedores = DatabaseWeb.getFornecedores();

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    public List<Fornecedor> getFornecedores() {
        return new ArrayList<Fornecedor>(fornecedores.values());
    }

    @POST
    @Consumes({MediaType.APPLICATION_JSON})
    public Fornecedor addFornecedor(Fornecedor novoFornecedor) {
        fornecedores.put("novoFornecedor.getId()",novoFornecedor);
        return novoFornecedor;
    }

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/{id}")
    public Fornecedor getFornecedor(@PathParam("id") int id){
        return fornecedores.get("id");
    }

    @PUT
    @Consumes({MediaType.APPLICATION_JSON})
    @Path("/{id}")
    public Fornecedor updateFornecedor(@PathParam("id")int id,Fornecedor updateFornecedor){
        updateFornecedor.setId(id);
        return fornecedores.put("id",updateFornecedor);
    }

    @DELETE
    @Path("/{id}")
    public void deleteFornecedor(@PathParam("id") String id){
        fornecedores.remove(id);
    }


    /*@GET
    public JsonArray findAll(){
        JsonArrayBuilder list = Json.createArrayBuilder();
        List<Fornecedor> fornecedores = em.find(F);
        for (Fornecedor fornecedor:fornecedores) {
            list.add(fornecedor.toJson());
        }
        return list.build();
    }*/




}
