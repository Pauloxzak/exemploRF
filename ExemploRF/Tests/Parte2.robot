*** Settings ***
Resource            ../Resources/resources.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Cases ***
Cenário 01: Cadastrar conta com sucesso, realizar busca e validar opções de pagamento
    Dado que estou na página de cadastro de clientes do site americanas.com.br
    Quando consigo realizar o cadastro corretamente
    Então consigo realizar uma busca por "MOTO G6"
    E adicionar dois itens no carrinho, então validar que o sitem oferece 10x e o valor é menos de 5 mil


