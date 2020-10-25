# exemploRF
Exemplo de alguns testes criados em Robot Framework

Instruções de instalação

1. Instalar python 3 de acordo com o sistema operacional, podem ser encontrados em www.python.org/downloads, utilize a opção de adicionar o python ao PATH do sistema
2. Após instalar python, abrir o prompt de comando e instalar o robot framework utilizando o comando "pip install robotframework"
3. Para validar que a instalação aconteceu com sucesso, utilize o comando "robot --version" que deve retornar a versão instalada do robot framework
4. Agora é preciso instalar o plugin para lidar com os testes web, utilizando o comando "pip install --upgrade robotframework-seleniumlibrary"
5. É preciso baixar o webdriver do chrome a partir do link https://sites.google.com/a/chromium.org/chromedriver/home
6. Após baixar, colocar o .exe dentro da pasta Scripts da instalação do Python

Execução

Pode-se utilizar o Visual Studio Code com o plugin "Robot Framework Intellisense" para a execução
1. Abrir a pasta do projeto
2. No menu terminal, criar um novo terminal no VSC
3. Utilizar o comando "robot Tests" para a execução de todos os testes ou "robot Tests\Parte1.robot" para executar, por exemplo, apenas a parte 1
