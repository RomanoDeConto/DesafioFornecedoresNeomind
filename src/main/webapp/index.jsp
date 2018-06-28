﻿<html>
<meta charset="utf-8">
<head>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-mask/1.8.7/mask.min.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</head>

<body ng-app="App" ng-controller="AppCtrl">
<div class="container">
    <table class="table table-striped ">
        <thead>
                <h1 color="black">Cadastro de Fornecedores</h1>
        </thead>
        <tbody>
            <thead class="p-2 mb-5 bg-light text-secundary">
                <tr>
                    <th width="80px">Id</th>
                    <th width="350px">Nome</th>
                    <th width="350px">E-mail</th>
                    <th width="350px">Comentário</th>
                    <th>CNPJ</th>
                    <th width="200px"><button class="btn btn-outline-success btn-md" data-toggle="modal" data-target="#modalNovo" ng-click="limpaDados()">Novo Cadastro</button></th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="fornecedor in fornecedores">
                    <td width="80px">{{fornecedor.id}}</td>
                    <td>{{fornecedor.name}}</td>
                    <td>{{fornecedor.email}}</td>
                    <td>{{fornecedor.comment}}</td>
                    <td>{{fornecedor.cnpj}}</td>
                    <td>
                        <button class="btn btn-outline-info btn-sm" data-toggle="modal" data-target="#modalEditar" ng-click="editar(fornecedor.id)">Editar</button>
                        <button class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#modalExcluir" ng-click="editar(fornecedor.id)">Excluir</button>
                    </td>
                </tr>
                <div ng-if="erroUsuarioExiste" class="alert alert-warning" id="alertaNovo" role="alert">
                    Já existe usuário com este ID ou CNPJ!
                </div>
            </tbody>
        </tbody>
    </table>
</div>

<!-- Modal novo -->
<div class="modal fade" id="modalNovo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="exampleModalLabel">Novo Cadastro</h4>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form name="novoForm">
                    <div class="form-group">
                        <label for="fornecedorId">Id</label>
                        <input only-digits type="text" maxlength="5" name="fornecedorId" ng-style="{border: !novoForm.fornecedorId.$valid  ? '1px solid red' : none}" required class="form-control" id="fornecedorId" ng-model="novoFornecedor.id" placeholder="Id">
                    </div>
                    <div class="form-group">
                        <label for="fornecedorName">Nome</label>
                        <input type="text" maxlength="30" name="fornecedorName" ng-style="{border: !novoForm.fornecedorName.$valid ? '1px solid red' : none}" required class="form-control" id="fornecedorName" ng-model="novoFornecedor.name" placeholder="Nome">
                    </div>
                    <div class="form-group">
                        <label for="fornecedorEmail">Email</label>
                        <input type="email" maxlength="30" name="fornecedorEmail" ng-style="{border: !novoForm.fornecedorEmail.$valid ? '1px solid red' : none}" required class="form-control" id="fornecedorEmail" ng-model="novoFornecedor.email" placeholder="E-mail">
                    </div>
                    <div class="form-group">
                        <label for="fornecedorComment">Comentário</label>
                        <input type="text" maxlength="50"class="form-control" id="fornecedorComment" ng-model="novoFornecedor.comment" placeholder="Comentário">
                    </div>
                    <div class="form-group">
                        <label for="fornecedorCnpj">CNPJ</label>
                        <input type="text" ng-pattern="/^\d{2}.\d{3}.\d{3}\/\d{4}\-\d{2}$/" ui-mask="99.999.999/9999-99" name="fornecedorCnpj" ng-style="{border: !novoForm.fornecedorCnpj.$valid ? '1px solid red' : none}" required class="form-control" id="fornecedorCnpj" ng-model="novoFornecedor.cnpj">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                <button type="button" ng-disabled="!novoForm.$valid" ng-click="inserir(false)" data-dismiss="modal" class="btn btn-primary">Salvar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal editar -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Editar Cadastro</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form name="editarForm">
                    <div class="form-group">
                        <label>Id: {{fornecedor.id}}</label>
                    </div>
                    <div class="form-group">
                        <label for="editarFornecedorName">Nome</label>
                        <input type="text" maxlength="30"required name="editarFornecedorName" ng-style="{border: !editarForm.editarFornecedorName.$valid ? '1px solid red' : none}" class="form-control" id="editarFornecedorName" ng-model="fornecedor.name" placeholder="Nome">
                    </div>
                    <div class="form-group">
                        <label for="editarFornecedorEmail">Email</label>
                        <input type="email" maxlength="30" required name="editarFornecedorEmail" ng-style="{border: !editarForm.editarFornecedorEmail.$valid ? '1px solid red' : none}" class="form-control" id="editarFornecedorEmail" ng-model="fornecedor.email" placeholder="E-mail">
                    </div>
                    <div class="form-group">
                        <label for="editarFornecedorComment">Comentário</label>
                        <input type="text" maxlength="50" class="form-control" id="editarFornecedorComment" ng-model="fornecedor.comment" placeholder="Comentário">
                    </div>
                    <div class="form-group">
                        <label for="editarfornecedorCnpj">CNPJ</label>
                        <input type="text" ng-pattern="/^\d{2}.\d{3}.\d{3}\/\d{4}\-\d{2}$/" ui-mask="99.999.999/9999-99" required name="editarfornecedorCnpj" ng-style="{border: !editarForm.editarfornecedorCnpj.$valid ? '1px solid red' : none}" class="form-control" id="editarFornecedorCnpj" ng-model="fornecedor.cnpj">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                <button type="button"  ng-disabled="!editarForm.$valid" ng-click="inserir(true)" data-dismiss="modal" class="btn btn-primary">Salvar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal excluir -->
<div class="modal fade" id="modalExcluir" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" >Deseja realmente excluir {{fornecedor.name}}?</h5>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Não</button>
                <button type="button" ng-click="delete(fornecedor.id)" data-dismiss="modal" class="btn btn-danger">Sim</button>
            </div>
        </div>
    </div>
</div>
</body>

<script>
    angular.module('App', ['ui.mask'])
        .controller('AppCtrl', function($scope, $http) {
            $scope.novoFornecedor = {id: '', name: '', email: '', comment: '', cnpj: ''};

            $http.get("http://localhost:8080/api/fornecedor").then(function(response) {
                $scope.fornecedores = response.data;
            });

            $scope.inserir = function (existe) {
                $scope.erroUsuarioExiste = false;
                if (existe){
                    $http.put("http://localhost:8080/api/fornecedor/"+$scope.fornecedor.id, $scope.fornecedor).then(function (responsePost) {
                        $http.get("http://localhost:8080/api/fornecedor").then(function (responseGet) {
                            $scope.fornecedores = responseGet.data;
                        });
                    });
                }
                else {
                    $http.post("http://localhost:8080/api/fornecedor", $scope.novoFornecedor).then(function (responsePost) {
                        if (responsePost.data.id == null ) {
                            $scope.erroUsuarioExiste = true;
                        }
                        else {
                            $scope.erroUsuarioExiste = false;
                        }
                        $http.get("http://localhost:8080/api/fornecedor").then(function (responseGet) {
                            $scope.fornecedores = responseGet.data;
                        });
                    });
                }
            }
            $scope.limpaDados = function () {
                $scope.erroUsuarioExiste = false;
                $scope.novoFornecedor = {id: '', name: '', email: '', comment: '', cnpj: ''};
            }
            $scope.editar= function(id){
                $scope.erroUsuarioExiste = false;
                $http.get("http://localhost:8080/api/fornecedor/"+id).then(function(responseGet) {
                    $scope.fornecedor = responseGet.data;
                });
            }
            $scope.delete = function (id) {
                $scope.erroUsuarioExiste = false;
                $http.delete("http://localhost:8080/api/fornecedor/"+id);
                $http.get("http://localhost:8080/api/fornecedor").then(function (responseGet) {
                    $scope.fornecedores = responseGet.data;
                });

            }
        }).directive('onlyDigits', function () {
            return {
                require: 'ngModel',
                link: function (scope, element, attr, ngModelCtrl) {
                    function fromUser(text) {
                        if (text) {
                            var transformedInput = text.replace(/[^0-9]/g, '');

                            if (transformedInput !== text) {
                                ngModelCtrl.$setViewValue(transformedInput);
                                ngModelCtrl.$render();
                            }
                            return transformedInput;
                        }
                        return undefined;
                    }
                    ngModelCtrl.$parsers.push(fromUser);
                }
            };
        })
</script>
</html>