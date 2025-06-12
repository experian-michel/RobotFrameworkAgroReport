*** Settings ***
Documentation     Executa casos de testes de solicitação de ertificação 2BSvs
Resource          ../resources/resource.robot
Library           ../.venv/lib/python3.10/site-packages/robot/libraries/Telnet.py
*** Test Cases ***
Solicitar Certificação 2BSvs com idioma Português
    [Documentation]    Caso de teste para Solicitar Certificação 2BSvs
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card para upload     Certificação 2BSvs    ${CSV_2BSvs}
    Selecionar Language    Português
    Sleep    1s
    Clicar no botão    Próximo
    Clicar no botão    Solicitar
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Certificação 2BSvs com idioma Inglês
    [Documentation]    Caso de teste para Solicitar Certificação 2BSvs com arquivo de importação .csv
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card para upload     Certificação 2BSvs    ${CSV_2BSvs}
    Selecionar Language    Inglês
    Sleep    1s
    Clicar no botão    Próximo
    Clicar no botão    Solicitar
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Certificação 2BSvs com idioma Espanhol
    [Documentation]    Caso de teste para Solicitar Certificação 2BSvs com arquivo de importação .csv
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card para upload     Certificação 2BSvs    ${CSV_2BSvs}
    Selecionar Language    Espanhol
    Sleep    1s
    Clicar no botão    Próximo
    Clicar no botão    Solicitar
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser


Solicitar CSV Exemplo Certificação 2BSvs
    [Documentation]    Caso de teste para Solicitar Certificação 2BSvs com arquivo de importação .csv
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Certificação 2BSvs
    Clicar Botao Baixar CSV Exemplo
    Sleep    1s
    Fechar Browser