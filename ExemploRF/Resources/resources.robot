*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn

*** Variables ***
${URL}          https://cliente.americanas.com.br/simple-login/cadastro/pf?next=https%3A%2F%2Fwww.americanas.com.br%2F
${BROWSER}      chrome

*** Keywords ***
Abrir navegador
    Open Browser        ${URL}       ${BROWSER}
    Set Selenium Timeout        60

Fechar navegador
    Close Browser

Dado que estou na página de cadastro de clientes do site americanas.com.br
    Wait Until Page Contains                 Cadastre-se

Quando realizo o cadastro utilizando o email "teste@hotmail.com"
    Input Text              id:email-input                      teste@hotmail.com       true
    Input Password          id:password-input                   Teste@123               true
    Input Text              id:cpf-input                        95465964006             true
    Input Text              id:name-input                       Teste Sobrenome         true
    Input Text              id:birthday-input                   01011980                true
    Input Text              id:phone-input                      19987654321             true
    Click Element           xpath://*[@id="gender"]/div[1]/label                       
    Click Button            xpath://*[@id="root"]/div/div[2]/form/button
    Sleep                   60

Então o site deve retornar uma mensagem de que o email já está cadastrado
    Element Should Be Visible           xpath://*[@id="email"]/div
    Element Text Should Be              xpath://*[@id="email"]/div      E-mail já cadastrado      

Quando realizo o cadastro utilizando uma senha de apenas dois caracteres
    Input Text              id:email-input                      novomail12345@hotmail.com        true
    Input Password          id:password-input                   12                               true
    Input Text              id:cpf-input                        95465964006                      true
    Input Text              id:name-input                       Teste Sobrenome                  true
    Input Text              id:birthday-input                   01011980                         true
    Input Text              id:phone-input                      19987654321                      true
    Click Element           xpath://*[@id="gender"]/div[1]/label                       
    Click Button            xpath://*[@id="root"]/div/div[2]/form/button
    Sleep                   60

Então o site deve retornar uma mensagem de que a senha é muito fraca
    Element Should Be Visible           xpath://*[@id="password"]/div[2]
    Element Text Should Be              xpath://*[@id="password"]/div[2]      Senha precisa ter entre 6 a 50 caracteres.

Quando realizo o cadastro utilizando um CPF inválido
    Input Text              id:email-input                      novomail12345@hotmail.com        true
    Input Password          id:password-input                   Teste@123                        true
    Input Text              id:cpf-input                        12345678900                      true
    Input Text              id:name-input                       Teste Sobrenome                  true
    Input Text              id:birthday-input                   01011980                         true
    Input Text              id:phone-input                      19987654321                      true
    Click Element           xpath://*[@id="gender"]/div[1]/label                       
    Click Button            xpath://*[@id="root"]/div/div[2]/form/button
    Sleep                   60

Então o site deve retornar uma mensagem de que o CPF é inválido
    Element Should Be Visible           xpath://*[@id="cpf"]/div
    Element Text Should Be              xpath://*[@id="cpf"]/div      CPF inválido.

Quando consigo realizar o cadastro corretamente
    Input Text              id:email-input                      novomail12345@hotmail.com        true
    Input Password          id:password-input                   Teste@123                        true
    Input Text              id:cpf-input                        95465964006                      true
    Input Text              id:name-input                       Teste Sobrenome                  true
    Input Text              id:birthday-input                   01011980                         true
    Input Text              id:phone-input                      19987654321                      true
    Click Element           xpath://*[@id="gender"]/div[1]/label                       
    Click Button            xpath://*[@id="root"]/div/div[2]/form/button
    Sleep                   60

Então consigo realizar uma busca por "MOTO G6"
    Input Text              id:h_search-input                   MOTO G6
    Click Button            id:h_search-btn

E adicionar dois itens no carrinho, então validar que o sitem oferece 10x e o valor é menos de 5 mil
    Sleep                           5
    Click Element                   xpath://*[@id="root"]/div/div/div[3]/div[4]/div[1]/div/a
    Sleep                           5
    Click Element                   id:btn-buy
    Sleep                           5
    Click Element                   id:btn-continue
    Sleep                           5
    Input Text                      name:productQuantity                2
    Element Text Should Not Be      xpath://*[@id="app"]/section/section/div[2]/div/div[1]/span[2]      R$ 5000,00
    Element Text Should Be          xpath://*[@id="app"]/section/section/div[2]/div/div[1]/div          em até 12x sem juros