*** Settings ***
Resource            ../Resources/resources.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Cases ***
Cenário 01: Preencher o cadastro com "teste@hotmail.com" e validar a mensagem de e-mail já cadastrado
    Dado que estou na página de cadastro de clientes do site americanas.com.br
    Quando realizo o cadastro utilizando o email "teste@hotmail.com"
    Então o site deve retornar uma mensagem de que o email já está cadastrado

Cenário 02: Inserir uma senha com dois caracteres e validar a mensagem "senha fraca"
    Dado que estou na página de cadastro de clientes do site americanas.com.br
    Quando realizo o cadastro utilizando uma senha de apenas dois caracteres
    Então o site deve retornar uma mensagem de que a senha é muito fraca

Cenário 03: Inserir um CPF inválido e validar a mensagem "Campo inválido"
    Dado que estou na página de cadastro de clientes do site americanas.com.br
    Quando realizo o cadastro utilizando um CPF inválido
    Então o site deve retornar uma mensagem de que o CPF é inválido
