*** Settings ***
Documentation     This is the first Robot Framework test suite.
Resource          ../resources/resource.robot
Library           ../.venv/lib/python3.10/site-packages/robot/libraries/Telnet.py

*** Test Cases ***
Solicitar Fiscalização por Sensoriamento Remoto Tipo de Resolução Padrão
    [Documentation]    Caso de teste para Solicitar Fiscalização por Sensoriamento Remoto
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Fiscalização por Sensoriamento Remoto
    Selecionar Proprietário    126 
    Selecionar Propriedade
    Selecionar Tipo de Resolução    Padrão
    Preencher Número do Contrato    517501211
    Preencher Nome da Instituição    Banco do Brasil
    Preenche Responsável pela Instituição    Luiz
    Selecionar Município    São Paulo
    Selecionar Safra Fiscalizacao   1ª Safra 2019/2020
    Selecionar Cultura Fiscalizacao    Soja
    Preencher Área Total Financiada    150.0
    Preencher Produção Esperada    5
    Preenchimento Tipos de Solo Fiscalização    Arenoso
    Preencher Grupos de Cultura    Grupo I
    Selecionar Data do Plantio Fiscalização Padrao  22/05/2025
    Preencher Data de Colheita Padrao    02/12/2020
    Sleep    1s
    Selecionar Vencimento do Contrato Padrao   01/12/2024
    Sleep    1s
    Marcar Checkbox Assinar Relatorios Com Modal    
    Tratar Modal Assinatura Relatorio    Ok
    Clicar no botão Solicitar Relatório_
    Clicar Botão do Modal    OK
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Fiscalização por Sensoriamento Remoto Tipo de Resolução BACEN
    [Documentation]    Caso de teste para Solicitar Fiscalização por Sensoriamento Remoto
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Fiscalização por Sensoriamento Remoto
    Selecionar Proprietário    126 
    Selecionar Propriedade
    Selecionar BACEN    517501211
    Preenche Responsável pela Instituição    Luiz
    Selecionar Safra Financiada    1ª Safra 2024/2025
    Selecionar Cultura Financiada    Soja
    Preencher Área Total Financiada    150.0
    Preencher Produção Esperada    5
    Preencher Tipos de Solo    Arenoso
    Preencher Grupos de Cultura    Grupo I
    Selecionar Data do Plantio Fiscalização    22/05/2020
    Selecionar Data de Colheita    02/12/2020
    Selecionar Vencimento do Contrato    01/12/2024
    Sleep    1s
    Marcar Checkbox Assinar Relatorios Com Modal    
    Tratar Modal Assinatura Relatorio    Ok
    Clicar no botão Solicitar Relatório_
    # Gerenciar Modal Salvar Geometria BACEN    Não
    Clicar Botão do Modal    OK
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser
Solicitar Importação do arquivo .csv Fiscalização por Sensoriamento Remoto Tipo de Resolução Padrão
    [Documentation]    Caso de teste para Solicitar Fiscalização por Sensoriamento Remoto com Tipo de Resolução Padrão
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Fiscalização por Sensoriamento Remoto
    Selecionar Método de Solicitação    Em lote
    Selecionar Tipo de Resolução    Padrão
    Selecionar csv    ${CSV_FSR_PD}
    Sleep    3s
    Fechar Browser
Solicitar Importação do arquivo .csv Fiscalização por Sensoriamento Remoto Tipo de Resolução BACEN
    [Documentation]    Caso de teste para Solicitar Fiscalização por Sensoriamento Remoto com Tipo de Resolução BACEN 09 digitos
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Fiscalização por Sensoriamento Remoto
    Selecionar Método de Solicitação    Em lote
    Selecionar Tipo de Resolução    Resolução BACEN
    Selecionar csv    ${CSV_FSR_BC_09}
    Sleep    3s
    Fechar Browser
Solicitar Importação do arquivo .csv Fiscalização por Sensoriamento Remoto Tipo de Resolução BACEN
    [Documentation]    Caso de teste para Solicitar Fiscalização por Sensoriamento Remoto com Tipo de Resolução BACEN 11 digitos
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Fiscalização por Sensoriamento Remoto
    Selecionar Método de Solicitação    Em lote
    Selecionar Tipo de Resolução    Resolução BACEN
    Selecionar csv    ${CSV_FSR_BC_11}
    Sleep    3s
    Fechar Browser
Solicitar Fiscalização por Sensoriamento Remoto sem CPF
    [Documentation]    Caso de teste para Solicitar Fiscalização por Sensoriamento Remoto sem CPF
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Fiscalização por Sensoriamento Remoto
    Selecionar Proprietário    126 
    Selecionar Propriedade
    Selecionar Tipo de Resolução    Padrão
 


