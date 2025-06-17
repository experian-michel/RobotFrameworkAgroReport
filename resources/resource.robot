*** Settings ***
Documentation     Resource file for AgroReport project
Library           SeleniumLibrary
Library           ../.venv/lib/python3.10/site-packages/robot/libraries/Collections.py
Library           DateTime
Library           ../.venv/lib/python3.10/site-packages/robot/libraries/String.py
Library           String
Resource          ../resources/variables.robot


*** Keywords ***
Abrir Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window


Titulo deve ser
    [Arguments]    ${title}
    Title Should Be    ${title}

Login no Farm
    Abrir Browser    ${URL}    ${BROWSER}
    Titulo deve ser    ${TITLE}
    Click Element    id:auth_username
    Input Text    id:auth_username    ${USER}
    Click Element    id:auth_password
    Input Password    id:auth_password    ${PASS}
    Click Button    //button[@type='submit']
    Sleep    2s
    # Remove o chat fixo do iframe launcher, se existir

Acessar modulo AgroReport
    Wait Until Element Is Visible    css=.ant-drawer-content-wrapper    timeout=20s
    Click Element    xpath=//*[contains(text(), 'Agro Report')]
    Sleep    3s
    # É usado JavaScript para remover a chat de ajuda
    # Remove overlays fixos que podem atrapalhar o clique 
    Execute JavaScript    var iframe=document.getElementById('launcher');if(iframe) iframe.remove();
    # Remove a div principal do widget de mensagem, se existir
    Execute JavaScript    var iframe=document.querySelector('iframe[title="Fechar mensagem"]');if(iframe) iframe.remove();
    # Remove o iframe do botão "Fechar mensagem", se existir
    Execute JavaScript    Array.from(document.querySelectorAll('div[style*="z-index: 999999"]')).forEach(function(el){el.remove();});

Selecionar card
    ##### Parametros que tem que ser passado para cada relatório
    # Análise Detalhada de Desmatamento
    # Análise Detalhada de Desmatamento | EUDR
    # Conformidade Socioambiental
    # Conformidade Socioambiental | EUDR
    # Conformidade Socioambiental | Projetistas
    # Conformidade Socioambiental | Protocolo Cecafe
    # Conformidade Socioambiental | Protocolo Marfrig
    # Certificação 2BSvs
    # Certificação RenovaBio
    # Diagnóstico de Carteira | Soja em Desmatamento.
    # Fiscalização por Sensoriamento Remoto
    # Protocolo de Monitoramento de Fornecedores de Gado
    # Relatório Gerencial de Crédito Agro
    # Relatório de Sinistro
    # Valoração de Imóveis Rurais
    [Arguments]    ${relatorio}
    Sleep     0.5s
    Wait Until Element Is Visible    xpath=//*[normalize-space(text())='${relatorio}']    timeout=20s
    Click Element    xpath=//h1[normalize-space(text())='${relatorio}']/ancestor::div[@data-testid='pb-t-report-card']//button[@data-testid='button-request-report']
    Wait Until Element Is Visible    css=.ant-drawer-header-title    timeout=10s
    Wait Until Element Contains    css=.ant-drawer-header-title    ${relatorio}    timeout=10s
    Element Text Should Be    css=.ant-drawer-header-title    ${relatorio}
    Wait Until Element Is Visible    css=.ant-drawer-content-wrapper
    # Click Element    css=.sc-ikkxIA.ijzQGg
    Sleep    1s

Selecionar card para upload
    ##### Parametros que tem que ser passado para cada relatório
    # Análise Detalhada de Desmatamento
    # Análise Detalhada de Desmatamento | EUDR
    # Conformidade Socioambiental
    # Conformidade Socioambiental | EUDR
    # Conformidade Socioambiental | Projetistas
    # Conformidade Socioambiental | Protocolo Cecafe  -  ${CSV_CS_CECAFE}
    # Conformidade Socioambiental | Protocolo Marfrig
    # Certificação 2BSvs
    # Certificação RenovaBio
    # Diagnóstico de Carteira | Soja em Desmatamento.
    # Fiscalização por Sensoriamento Remoto
    # Protocolo de Monitoramento de Fornecedores de Gado
    # Relatório Gerencial de Crédito Agro
    # Relatório de Sinistro
    # Valoração de Imóveis Rurais
    [Arguments]    ${relatorio}    ${CSV}
    # Aguarda o título do relatório aparecer
    Wait Until Element Is Visible    xpath=//*[normalize-space(text())='${relatorio}']    timeout=20s
    # Clica no botão "Solicitar relatório"
    Click Element    xpath=//h1[normalize-space(text())='${relatorio}']/ancestor::div[@data-testid='pb-t-report-card']//button[@data-testid='button-request-report']
    # Aguarda o drawer abrir e valida o título
    Wait Until Element Is Visible    css=.ant-drawer-title    timeout=10s
    Wait Until Element Contains      css=.ant-drawer-title    ${relatorio}    timeout=10s
    Element Text Should Be           css=.ant-drawer-title    ${relatorio}
    # Aguarda o conteúdo do drawer
    Wait Until Element Is Visible    css=.ant-drawer-content-wrapper    timeout=10s
    # Torna o input de upload visível via JavaScript
    Execute JavaScript    document.querySelector("input[type='file']").style.display = 'block'
    # Envia o arquivo CSV
    Choose File     xpath=//input[@type='file']    ${CSV}
    Sleep    1s


Selecionar Proprietário
    [Arguments]    ${proprietario}
    # Pode ser passado o nome inteiro, CPF ou CNPJ
    Input Text    css=#rc_select_16    ${proprietario}
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'ant-select-item-option') and not(contains(@class, 'ant-select-item-option-disabled'))]    timeout=20s
    Wait Until Element Is Enabled    xpath=//div[contains(@class, 'ant-select-item-option') and not(contains(@class, 'ant-select-item-option-disabled'))]    timeout=10s
    ${dropdown}=    Get WebElement    css:#rc_select_16
    Press Key    ${dropdown}    \\40
    Sleep    1s
    Press Key    ${dropdown}    \\13
    Sleep    1s

Selecionar Propriedade
    # A propriedade vai ser pega a primeira que achar na lista
    Wait Until Element Is Visible    css=.sc-ikkxIA.ijzQGg.sc-kpKSZj.fUxKKk    timeout=10s
    Click Element    css=.sc-ikkxIA.ijzQGg.sc-kpKSZj.fUxKKk
    ${dropdown}=    Get WebElement    css=#rc_select_17
    Press Key    ${dropdown}    \\40
    Sleep    1s
    Press Key    ${dropdown}    \\13

Selecionar Criterios Socioambientais - todos
    Click Element    css=input[placeholder="Critérios Socioambientais"]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//span[normalize-space(text())="Selecionar Todos"]    timeout=10s
    Click Element    xpath=//span[normalize-space(text())="Selecionar Todos"]/preceding-sibling::span[contains(@class, "ant-checkbox")]

Selecionar Evento
    [Arguments]    ${evento}
    # Abre o dropdown do evento usando o data-testid correto
    Click Element    xpath=//div[@data-testid="select-event"]//div[contains(@class,"ant-select-selector")]
    Sleep    0.5
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${evento}']    timeout=10s
    Click Element    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${evento}']

Selecionar Safra
    [Arguments]    ${safra}
    # Clica no seletor de safra
    Click Element    xpath=//div[@data-testid="select-crop-year"]//div[contains(@class,"ant-select-selector")]
    # Aguarda a opção com o texto da safra aparecer
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${safra}']    timeout=10s
    # Clica na opção desejada
    Click Element    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${safra}']

Selecionar Safra Diagnostico Carteira
    [Arguments]    ${safra}
    # Clica no seletor de safra pelo ID do input
    Click Element    xpath=//input[@id="cropYear"]/ancestor::div[contains(@class,"ant-select")]
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${safra}']    timeout=10s
    Click Element    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${safra}']

Selecionar Safra Relatorio Sinistro
    [Arguments]    ${safra}
    # Clica no seletor de safra pelo data-testid
    Click Element    xpath=//div[@data-testid="select-crop-year"]//div[contains(@class,"ant-select-selector")]
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${safra}']    timeout=10s
    Click Element    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${safra}']


Selecionar Safra Financiada
    [Arguments]    ${safra}
    [Documentation]    Seleciona a opção da combo "Safra financiada" pelo valor informado, somente se ainda não estiver preenchido.
    ${selecionada}=    Get Text    xpath=//div[@label="Safra financiada"]//span[contains(@class,"ant-select-selection-item")]
    Run Keyword If    '${selecionada}' == ''    Preencher Safra    ${safra}
    ...    ELSE    Log    Safra já preenchida: ${selecionada}

Selecionar Safra Fiscalizacao
    [Arguments]    ${safra}
    # Abre o dropdown clicando no seletor da safra financiada
    Click Element    xpath=//label[normalize-space(text())="Safra financiada"]/following-sibling::div[contains(@class,"ant-select")]//div[contains(@class,"ant-select-selector")]
    # Aguarda o dropdown ficar visível (sem a classe hidden)
    Wait Until Element Is Visible    xpath=//div[contains(@class,"ant-select-dropdown") and not(contains(@class,"ant-select-dropdown-hidden"))]    timeout=10s
    # Monta o xpath do item desejado
    ${option_xpath}=    Set Variable    //div[contains(@class,"ant-select-dropdown") and not(contains(@class,"ant-select-dropdown-hidden"))]//div[contains(@class,"ant-select-item-option-content") and normalize-space(text())="${safra}"]
    # Aguarda o item aparecer no DOM (pode estar fora da tela, mas já renderizado)
    Wait Until Page Contains Element    ${option_xpath}    timeout=5s
    # Rola até o item (caso esteja fora da área visível)
    Scroll Element Into View    ${option_xpath}
    Sleep    0.2
    # Aguarda o item estar visível na tela
    Wait Until Element Is Visible    ${option_xpath}    timeout=5s
    # Clica no item desejado
    Click Element    ${option_xpath}
    Sleep    0.5
Preencher Safra
    [Arguments]    ${safra}
    Click Element    xpath=//div[@label="Safra financiada"]//div[contains(@class,"ant-select-selector")]
    Input Text    xpath=//div[@label="Safra financiada"]//input[@type="search"]    ${safra}
    Sleep    0.2
    Press Keys    xpath=//div[@label="Safra financiada"]//input[@type="search"]    ENTER

Selecionar Cultura Fiscalizacao
    [Arguments]    ${cultura}
    # Abre o dropdown de "Cultura financiada"
    Click Element    xpath=//label[normalize-space(text())="Cultura financiada"]/following-sibling::div[contains(@class,"ant-select")]//div[contains(@class,"ant-select-selector")]
    # Aguarda o dropdown ficar visível (sem a classe hidden)
    Wait Until Element Is Visible    xpath=//div[contains(@class,"ant-select-dropdown") and not(contains(@class,"ant-select-dropdown-hidden"))]    timeout=10s
    # Monta o xpath do item desejado
    ${option_xpath}=    Set Variable    //div[contains(@class,"ant-select-dropdown") and not(contains(@class,"ant-select-dropdown-hidden"))]//div[contains(@class,"ant-select-item-option-content") and normalize-space(text())="${cultura}"]
    # Aguarda o item aparecer no DOM
    Wait Until Page Contains Element    ${option_xpath}    timeout=5s
    # Rola até o item (caso esteja fora da área visível)
    Scroll Element Into View    ${option_xpath}
    Sleep    0.2
    # Aguarda o item estar visível na tela
    Wait Until Element Is Visible    ${option_xpath}    timeout=5s
    # Clica no item desejado
    Click Element    ${option_xpath}
    Sleep    0.5



Selecionar Cultura
    # Seleciona Cultura (exemplo: Soja)
    # Possíveis valores: Soja, Milho, Algodão, Café
    [Arguments]    ${cultura}
    Sleep    0.5
    Click Element    xpath=//div[@data-testid="select-crop"]//div[contains(@class,"ant-select-selector")]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${cultura}']    timeout=5s
    Click Element    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${cultura}']

Selecionar Cultura Financiada
    # Soja, Cana-de-açúcar, Milho, Algodão, Trigo, Café
    [Arguments]    ${cultura}
    [Documentation]    Seleciona a opção "Cultura financiada" somente se o campo não estiver preenchido.
    ${selecionada}=    Get Text    xpath=//div[@label="Cultura financiada"]//span[contains(@class,"ant-select-selection-item")]
    Run Keyword If    '${selecionada}' != ''    Log    Campo já preenchido: ${selecionada}    INFO
    Run Keyword If    '${selecionada}' == ''    Preencher Cultura Financiada    ${cultura}

Preencher Cultura Financiada
    [Arguments]    ${cultura}
    Click Element    xpath=//div[@label="Cultura financiada"]//div[contains(@class,"ant-select-selector")]
    Input Text    xpath=//div[@label="Cultura financiada"]//input[@type="search"]    ${cultura}
    Sleep    0.2
    Press Keys    xpath=//div[@label="Cultura financiada"]//input[@type="search"]    ENTER

Selecionar area
    # Preenche Área Total
    [Arguments]    ${area}
    Input Text    xpath=//input[@data-testid="input-total-area"]    ${area}
Preencher Área Total Financiada
    [Arguments]    ${valor}
    [Documentation]    Verifica se o campo "Área total financiada (ha)" está preenchido e, caso não esteja, insere o valor informado via parâmetro.
    ${valor_atual}=    Get Element Attribute    xpath=//input[@label="Área total financiada (ha)"]    value
    Run Keyword If    '${valor_atual}' != ''    Log    Campo "Área total financiada (ha)" já está preenchido com: ${valor_atual}    INFO
    Run Keyword If    '${valor_atual}' == ''    Input Text    xpath=//input[@label="Área total financiada (ha)"]    ${valor}
    ${novo_valor}=    Get Element Attribute    xpath=//input[@label="Área total financiada (ha)"]    value
    Run Keyword If    '${valor_atual}' == ''    Should Be Equal As Numbers    ${novo_valor}    ${valor}


Preencher Produção Esperada
    [Arguments]    ${valor}
    [Documentation]    Verifica se o campo "Produção esperada (ton)" está preenchido; caso não esteja, preenche com o valor informado.
    ${valor_atual}=    Get Element Attribute    xpath=//input[@label="Produção esperada (ton)"]    value
    Run Keyword If    '${valor_atual}' != ''    Log    Campo "Produção esperada (ton)" já está preenchido com: ${valor_atual}    INFO
    Run Keyword If    '${valor_atual}' == ''    Input Text    xpath=//input[@label="Produção esperada (ton)"]    ${valor}
    ${novo_valor}=    Get Element Attribute    xpath=//input[@label="Produção esperada (ton)"]    value
    Run Keyword If    '${valor_atual}' == ''    Should Be Equal As Numbers    ${novo_valor}    ${valor}


Preencher Tipos de Solo
    # AD1, AD2, AD3, AD4, AD5, AD6, AD7, AD8, AD9, Arenoso, Médio e Argiloso
    [Arguments]    ${solo}
    [Documentation]    Verifica se o campo "Tipos de solo" está preenchido e, caso não esteja, insere o valor informado.
    ${valor_atual}=    Get Text    xpath=//div[@label="Tipos de solo"]//span[contains(@class,"ant-select-selection-item")]
    Run Keyword If    '${valor_atual}' != ''    Log    Campo "Tipos de solo" já está preenchido com: ${valor_atual}    INFO
    Run Keyword If    '${valor_atual}' == ''    Preenchimento Tipos de Solo    ${solo}

Preenchimento Tipos de Solo
    [Arguments]    ${solo}
    Click Element    xpath=//div[@label="Tipos de solo"]//div[contains(@class,"ant-select-selector")]
    Input Text    xpath=//div[@label="Tipos de solo"]//input[@type="search"]    ${solo}
    Sleep    0.2
    Press Keys    xpath=//div[@label="Tipos de solo"]//input[@type="search"]    ENTER

Preenchimento Tipos de Solo Fiscalização
    [Arguments]    ${tipo_solo}
    # Abre o dropdown de tipos de solo
    Click Element    xpath=//div[@label="Tipos de solo"]//div[contains(@class,"ant-select-selector")]
    #Sleep    0.5
    # Aguarda o dropdown ficar visível (sem a classe hidden)
    Wait Until Element Is Visible    xpath=//div[contains(@class,"ant-select-dropdown") and not(contains(@class,"ant-select-dropdown-hidden"))]    timeout=10s
    # Monta o xpath do item habilitado pelo atributo title
    ${option_xpath}=    Set Variable    //div[contains(@class,"ant-select-dropdown") and not(contains(@class,"ant-select-dropdown-hidden"))]//div[contains(@class,"ant-select-item-option") and not(contains(@class,"ant-select-item-option-disabled")) and @title="${tipo_solo}"]
    # Aguarda o item estar visível
    Wait Until Element Is Visible    ${option_xpath}    timeout=5s
    # Faz scroll até o item (caso necessário)
    Scroll Element Into View    ${option_xpath}
    Sleep    0.2
    # Clica no item
    Click Element    ${option_xpath}
    Sleep    0.5
Preencher Grupos de Cultura
    [Arguments]    ${grupo}
    [Documentation]    Verifica se o campo "Grupos de cultura" está preenchido e, caso não esteja, insere o valor informado.
    ${preenchido}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@label="Grupos de cultura"]//span[contains(@class,"ant-select-selection-item")]
    Run Keyword If    ${preenchido}    Log    Campo "Grupos de cultura" já está preenchido. Nenhuma ação necessária.
    Run Keyword Unless    ${preenchido}    Selecionar Grupo de Cultura    ${grupo}

Selecionar Grupo de Cultura
    [Arguments]    ${grupo}
    # Clica para abrir o combobox
    Click Element    xpath=//div[@label="Grupos de cultura"]//div[contains(@class,"ant-select-selector")]
    Sleep    0.5s
    # Aguarda a opção aparecer no dropdown e clica nela (XPath específico para Ant Design)
    Wait Until Element Is Visible    xpath=//div[contains(@class,"ant-select-item-option-content") and normalize-space(text())="${grupo}"]    10s
    Click Element    xpath=//div[contains(@class,"ant-select-item-option-content") and normalize-space(text())="${grupo}"]

Verificar ou Definir Valor Em Grupos de Cultura
    [Arguments]    ${novo_valor}
    ${valor_atual}=    Get Element Attribute    xpath=//input[@id="rc_select_42"]    value
    Log    Valor atual do campo: ${valor_atual}
    Run Keyword If    '${valor_atual}' == ''    Input Text    xpath=//input[@id="rc_select_42"]    ${novo_valor}   
Selecionar Data
     [Arguments]    ${data}
    ${ano}=    Convert Date    ${data}    result_format=%Y
    ${mes_num}=    Convert Date    ${data}    result_format=%m
    ${mes}=    Convert To Integer    ${mes_num}
    ${dia_num}=    Convert Date    ${data}    result_format=%d
    ${dia}=    Convert To Integer    ${dia_num}
    Click Element    id=cutoffDate
    Wait Until Element Is Visible    //div[contains(@class,"ant-picker-panel")]
    FOR    ${i}    IN RANGE    24
       ${ano_atual}=    Get Text    //button[contains(@class,"ant-picker-year-btn")]
       Exit For Loop If    '${ano_atual}' == '${ano}'
       ${ano_atual_int}=    Convert To Integer    ${ano_atual}
       ${ano_int}=    Convert To Integer    ${ano}
       Run Keyword If    ${ano_int} > ${ano_atual_int}    Click Element    //button[contains(@class,"ant-picker-header-next-btn")]
       Run Keyword If    ${ano_int} < ${ano_atual_int}    Click Element    //button[contains(@class,"ant-picker-header-prev-btn")]
       Sleep    0.2
    END
    FOR    ${i}    IN RANGE    12
       ${mes_atual}=    Get Text    //button[contains(@class,"ant-picker-month-btn")]
       ${mes_atual_num}=    Evaluate    {'Jan':1, 'January':1,'Feb':2, 'February':2,'Mar':3, 'March':3,'Apr':4, 'April':4,'May':5,'Jun':6, 'June':6,'Jul':7, 'July':7,'Aug':8, 'August':8,'Sep':9, 'September':9,'Oct':10, 'October':10,'Nov':11, 'November':11,'Dec':12, 'December':12}['${mes_atual}']
       Exit For Loop If    ${mes_atual_num} == ${mes}
       Run Keyword If    ${mes} > ${mes_atual_num}    Click Element    //button[contains(@class,"ant-picker-header-next-btn")]
       Run Keyword If    ${mes} < ${mes_atual_num}    Click Element    //button[contains(@class,"ant-picker-header-prev-btn")]
       Sleep    0.2
    END
    Wait Until Element Is Visible    //td[@title="${data}"]
    Click Element    //td[@title="${data}"]
    Wait Until Element Does Not Contain    //body    ant-picker-panel
    ${data_br}=    Convert Date    ${data}    result_format=%d/%m/%Y
    Element Attribute Value Should Be    id=cutoffDate    value    ${data_br}

Selecionar Todos os Criterios Socioambientais
    # Clica no campo para abrir a lista de critérios
    Click Element    xpath=//div[@id='tags-input-container']
    # Aguarda o checkbox "Selecionar Todos" estar visível
    #Wait Until Element Is Visible    xpath=//input[@data-testid="check-all-checkbox"]    timeout=10s
    Wait Until Element Is Visible    xpath=//span[normalize-space(text())="Selecionar Todos"]    timeout=10s
    # Clica no checkbox "Selecionar Todos"
    Click Element    xpath=//input[@data-testid="check-all-checkbox"]

Selecionar Criterios Socioambientais todos - Conformidade Socioambiental   
    # Clica no campo para abrir os critérios
    Click Element    css=#tags-input-container
    # Aguarda o checkbox "Selecionar Todos" aparecer
    Wait Until Element Is Visible    xpath=//span[normalize-space(text())="Selecionar Todos"]    timeout=10s
    # Clica no checkbox "Selecionar Todos"
    Click Element    xpath=//span[normalize-space(text())="Selecionar Todos"]/preceding-sibling::span[contains(@class, "ant-checkbox")]
    Sleep    1s
    # --- Caso queira selecionar apenas o PRODES, use o código abaixo ---
    # Wait Until Element Is Visible    xpath=//span[normalize-space(text())="PRODES"]/preceding-sibling::span[contains(@class, "ant-checkbox")]    timeout=5s
    # Click Element    xpath=//span[normalize-space(text())="PRODES"]/preceding-sibling::span[contains(@class, "ant-checkbox")]
    # Sleep    1s

Preencher Observacao
    Click Element    css=.sc-ejfMa-d.gUnrdK
    Sleep    1s
    Wait Until Element Is Visible    css=textarea[data-testid="base-request-form-text-area-observations"]    timeout=10s
    ${text}=    Get WebElement    css=textarea[data-testid="base-request-form-text-area-observations"]
    ${texto}=    Set Variable    ${TEXTO_BASE} - ${QA}
    Input Text    ${text}    ${texto}
    Sleep    2s



Mensagem do front
    # Relatórios solicitados com sucesso
    # Relatório solicitado com sucesso
    # Selecione ao menos 1 Critério Sócio Ambiental
    # Relatórios não solicitados
    # Anexe pelo menos um arquivo para solicitar os relatórios.
    # Não exitem documentos válidos no arquivo enviado
    # Selecione pelo menos uma propriedade
    [Arguments]    ${mensagem}
    Wait Until Element Is Visible    css=div.ant-notification-notice-message    timeout=10s
    Element Should Contain    css=div.ant-notification-notice-message   ${mensagem}
    Sleep    3s


#    Manter o Via Lote e ajustar para conter [Arguments] onde vai ser passado por parametro
Selecionar via Lote
    [Arguments]    ${CSV}
    Wait Until Element Is Visible    xpath=//label[contains(., 'Em lote')]
    Click Element    xpath=//label[contains(., 'Em lote')]
    Sleep    1s
    Execute JavaScript    document.querySelector('[data-testid="dragger-file-upload"]').style.display = 'block'
    Choose File     css=[data-testid="dragger-file-upload"]    ${CSV}
    Sleep     1s

#    Manter o Via Lote e ajustar para conter [Arguments] onde vai ser passado por parametro

Selecionar csv
    ##### Parametros que tem que ser passado para cada relatório
    # Análise Detalhada de Desmatamento    -    ${CSV_ADD} 
    # Análise Detalhada de Desmatamento | EUDR
    # Conformidade Socioambiental | EUDR
    # Conformidade Socioambiental
    # Certificação 2BSvs    -    ${CSV_2BSvs}
    # Certificação RenovaBio    -    ${CSV_RenovaBio}
    # Relatório Gerencial de Crédito Agro    -    ${CSV_RGCA}
    
    [Arguments]    ${csv}
    Wait Until Element Is Visible    xpath=//label[contains(., 'Em lote')]
    Click Element    xpath=//label[contains(., 'Em lote')]
    Sleep    1s
    Execute JavaScript    document.querySelector("input[type='file']").style.display = 'block'
    Choose File     xpath=//input[@type='file']    ${csv}
    Sleep    1s

Clicar no botão Solicitar Relatório
    Wait Until Element Is Visible    xpath=(//button[@data-testid="button-request-report" and not(@disabled) and not(ancestor::div[contains(@style,"display: none")])])[last()]    timeout=10s
    Click Element    xpath=(//button[@data-testid="button-request-report" and not(@disabled) and not(ancestor::div[contains(@style,"display: none")])])[last()]
    Sleep    1s

Clicar Botao Solicitar Relatorio
    Click Element    css=button[data-testid="button-request-report"]


Clicar Solicitar relatório
    # Clica no botão "Solicitar relatório" do Ant Design
    # Click Element    xpath=//button[contains(@class,"ant-btn-primary")]//span[normalize-space(text())="Solicitar relatório"]/..
    # Click Button    xpath=//button[contains(@class,"ant-btn-primary") and .//span[normalize-space(text())="Solicitar relatório"]]
    # Click Button    xpath=//button[contains(@class,"ant-btn-primary")]//span[normalize-space(text())="Solicitar relatório"]/..
     Click Button    //button[@type='submit']
    # Aguarda o drawer ou overlay fechar
    # Wait Until Element Is Not Visible    xpath=//div[contains(@class,"ant-drawer-mask")]
    # Agora clica no botão
    # Click Button    xpath=//button[@data-testid="button-request-report"]


Clicar no botão
    # Próximo
    # Solicitar
    # Solicitar relatório
    # Concluir
    # Cancelar
    [Arguments]    ${acao}
    # Aguarda o botão pelo texto exato do span dentro do botão
    Wait Until Element Is Visible    xpath=//button[contains(@class,"ant-btn") and .//span[normalize-space(text())="${acao}"]]    timeout=10s
    # Clica no botão usando o mesmo xpath
    Click Element    xpath=//button[contains(@class,"ant-btn") and .//span[normalize-space(text())="${acao}"]]
    Sleep    1s

# 

Selecionar Idioma
    # Inglês
    # Português
    [Arguments]    ${idioma}
    Click Element    xpath=//input[@id='deforestation-eudr-language-select']/ancestor::div[contains(@class, 'ant-select')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${idioma}']    timeout=5s
    Click Element    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${idioma}']

Selecionar Idioma EUDR
    # Inglês
    # Português
    [Arguments]    ${idioma}
    Click Element    xpath=//div[@data-testid='select-languange']//div[contains(@class, 'ant-select-selector')]
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${idioma}']    timeout=5s
    Click Element    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${idioma}']

Selecionar Idioma a
   [Arguments]    ${idioma}
    # Abre o dropdown do idioma
    Click Element    xpath=//div[@label="Idioma" and contains(@class, 'ant-select')]//div[@class="ant-select-selector"]
    Sleep    0.5
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${idioma}']    timeout=5s
    Click Element    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${idioma}']

Selecionar Tipo Relatorio
    [Arguments]    ${tipo}
    # O tipo deve ser exatamente: Propriedades ou Municípios
    ${tipo_normalizado}=    Evaluate    "${tipo}".capitalize()
    # Monta XPath para o label com o texto correto
    ${xpath}=    Set Variable    //div[@data-testid="radio-group-report-type"]//label[span[normalize-space(text())="${tipo_normalizado}"]]
    Click Element    xpath=${xpath}

Preencher Propriedade Busca
    [Arguments]    ${propriedade}
    # Digita o valor no campo de busca de propriedade (ajuste o placeholder se necessário)
    Input Text    xpath=//input[@placeholder="Buscar propriedade"]    ${propriedade}
    Sleep    0.2
    Click Button    xpath=//button[.//span[@aria-label="plus"] and not(@disabled)]
    


Selecionar Commodity
    # Carne bovina
    # Sojá
    # Café
    [Arguments]    ${commodity}
    Click Element    xpath=//input[@id='rc_select_20']/ancestor::div[contains(@class, 'ant-select')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${commodity}']    timeout=5s
    Click Element    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${commodity}']

Selecionar Commodity EUDR
    # Carne bovina
    # Sojá
    # Café
    [Arguments]    ${commodity}
    Click Element    xpath=//div[@data-testid='select-commodity']//div[contains(@class, 'ant-select-selector')]
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${commodity}']    timeout=5s
    Click Element    xpath=//div[contains(@class, 'ant-select-item-option-content') and normalize-space(text())='${commodity}']

Fechar Browser
    Sleep    2s
    Close Browser

Preenche Instituição Financeira
    [Arguments]    ${instituicao}
    # Preenche Instituição Financeira
    Input Text    xpath=//input[@data-testid="input-financial-institution"]    ${instituicao}
    Sleep    0.2
Preenche Responsável pela Instituição
    [Arguments]    ${responsavel}    ${seletor}=label
    Run Keyword If    '${seletor}'=='label'    Input Text    xpath=//input[@label="Reponsável pela instituição"]    ${responsavel}
    ...    ELSE IF    '${seletor}'=='data-testid'    Input Text    xpath=//input[@data-testid="input-institution-officer"]    ${responsavel}
    Sleep    0.2    

Preenche Número da Apólice
    [Arguments]    ${apolice}
    # Preenche Número da Apólice
    Input Text    xpath=//input[@data-testid="input-policy-number"]    ${apolice}
    Sleep    0.2

Selecionar Data do Corte Diagnóstico de Carteira
    [Arguments]    ${data}
    Wait Until Element Is Visible    xpath=//input[@id="cutoffDate"]    timeout=10s
    Sleep    0.2
    Click Element   xpath=//input[@id="cutoffDate"] 
    # Usa apenas o valor da data, depois pressiona TAB duas vezes separadamente
    Press Keys   xpath=//input[@id="cutoffDate"]    ${data}
    Sleep    0.2
    Press Key    xpath=//input[@id="cutoffDate"]     \\09
    Sleep    0.1
    Press Key    xpath=//input[@id="cutoffDate"]     \\09
    Sleep    1s

Selecionar Data do Corte Readonly

    [Arguments]    ${data_br}
    # Separa o dia, mês e ano
    ${dia}    ${mes}    ${ano}=    Split String    ${data_br}    /
    ${dia}=    Evaluate    str(${dia}).zfill(2)
    ${mes}=    Evaluate    str(${mes}).zfill(2)
    ${data_iso}=    Set Variable    ${ano}-${mes}-${dia}
    # Abre o calendário
    Click Element    xpath=//input[@data-testid="date-picker-seeding"]
    Wait Until Element Is Visible    xpath=//div[contains(@class,"ant-picker-dropdown") and contains(@style,"display: block")]    timeout=5s
    # Lista dos meses abreviados em inglês
    ${meses}=    Create List    Jan    Feb    Mar    Apr    May    Jun    Jul    Aug    Sep    Oct    Nov    Dec
    FOR    ${index}    IN RANGE    12
       ${mes_atual}=    Get Text    xpath=(//div[contains(@class,"ant-picker-dropdown") and contains(@style,"display: block")]//button[contains(@class,"ant-picker-month-btn")])[last()]
       ${ano_atual}=    Get Text    xpath=(//div[contains(@class,"ant-picker-dropdown") and contains(@style,"display: block")]//button[contains(@class,"ant-picker-year-btn")])[last()]
       ${num_mes_atual}=    Evaluate    ${meses}.index(${mes_atual})+1
       ${num_mes_atual}=    Evaluate    str(${num_mes_atual}).zfill(2)
       Run Keyword If    '${ano_atual}'!='${ano}' or '${num_mes_atual}'!='${mes}'    Ajustar Calendario AntD Ingles    ${num_mes_atual}    ${mes}    ${ano_atual}    ${ano}
       Exit For Loop If    '${ano_atual}'=='${ano}' and '${num_mes_atual}'=='${mes}'
    END
    Click Element    xpath=//div[contains(@class,"ant-picker-dropdown") and contains(@style,"display: block")]//td[@title="${data_iso}"]
    Wait Until Element Does Not Contain    xpath=//div[contains(@class,"ant-picker-dropdown")]    display: block
    Sleep    0.5
    
Ajustar Calendario AntD Ingles
    [Arguments]    ${mes_atual}    ${mes_desejado}    ${ano_atual}    ${ano_desejado}
    Run Keyword If    ${ano_atual} < ${ano_desejado} or (${ano_atual}==${ano_desejado} and ${mes_atual}<${mes_desejado})    Click Element    xpath=(//div[contains(@class,"ant-picker-dropdown") and contains(@style,"display: block")]//button[contains(@class,"ant-picker-next-btn")])[last()]
    ...    ELSE IF    ${ano_atual} > ${ano_desejado} or (${ano_atual}==${ano_desejado} and ${mes_atual}>${mes_desejado})    Click Element    xpath=(//div[contains(@class,"ant-picker-dropdown") and contains(@style,"display: block")]//button[contains(@class,"ant-picker-prev-btn")])[last()]
    Sleep    0.2
#### mudar 
Selecionar Data do Corte
    [Arguments]    ${data}
    Wait Until Element Is Visible    xpath=//input[@data-testid="date-picker-seeding"]    timeout=10s
    Sleep    0.2
    Click Element    xpath=//input[@data-testid="date-picker-seeding"]
    # Usa apenas o valor da data, depois pressiona TAB duas vezes separadamente
    Press Keys   xpath=//input[@data-testid="date-picker-occurrence"]    ${data}
    Sleep    0.2
    Press Key    xpath=//input[@data-testid="date-picker-occurrence"]    \\09
    Sleep    0.1
    Press Key    xpath=//input[@data-testid="date-picker-occurrence"]    \\09
    Sleep    1s



Selecionar Data da Ocorrência
    [Arguments]    ${data}
    Wait Until Element Is Visible    xpath=//input[@data-testid="date-picker-occurrence"]    timeout=10s
    Click Element    xpath=//input[@data-testid="date-picker-occurrence"]
    # Usa apenas o valor da data, depois pressiona TAB duas vezes separadamente
    Press Keys    xpath=//input[@data-testid="date-picker-occurrence"]    ${data}
    Sleep    0.2
    Press Key    xpath=//input[@data-testid="date-picker-occurrence"]    \\09
    Sleep    0.1
    Press Key    xpath=//input[@data-testid="date-picker-occurrence"]    \\09
    Sleep    1s

Selecionar Data do Aviso
    [Arguments]    ${data}
    Wait Until Element Is Visible    xpath=//input[@data-testid="date-picker-notice"]    timeout=10s
    Click Element    xpath=//input[@data-testid="date-picker-notice"]
    Press Keys    xpath=//input[@data-testid="date-picker-notice"]    ${data}
    Sleep    0.2
    Press Key    xpath=//input[@data-testid="date-picker-notice"]    \\09
    Sleep    0.1
    Press Key    xpath=//input[@data-testid="date-picker-notice"]    \\09
    Sleep    1s

Selecionar BACEN
    # 20240242591 ---efetivo
    # 517501211 ---ref
    # 20240248647 ---efetivo
    # 517507500 ---ref
 
    [Arguments]    ${numBacen}
    # Seleciona o radio "Resolução BACEN"
    Sleep    0.5
    # Preenche Referência BACEN
    Click Element    xpath=//input[@label="Referência BACEN"]
    Input Text    xpath=//input[@label="Referência BACEN"]    ${numBacen}
    Wait Until Element Is Visible    xpath=//div[contains(@class,"ant-notification-notice-message")]    10s
    ${mensagem}=    Get Text    xpath=//div[contains(@class,"ant-notification-notice-message")]
    ${mensagem_esperada}=    Set Variable    Buscando informações adicionais pela Referência BACEN ${numBacen}
    Should Be Equal As Strings    ${mensagem}    ${mensagem_esperada}
    Sleep    5s
Preencher Número do Contrato
    [Arguments]    ${valor}
    ${xpath}=    Set Variable    //label[contains(text(),"Número do contrato")]/following-sibling::input
    # Alternativamente, caso o input não seja irmão direto do label:
    # ${xpath}=    Set Variable    //label[contains(text(),"Número do contrato")]/ancestor::div[contains(@class,"label-input")]//input
    Wait Until Element Is Visible    ${xpath}
    Clear Element Text              ${xpath}
    Input Text                      ${xpath}    ${valor}

Preencher Nome da Instituição
    [Arguments]    ${valor}
    ${xpath}=    Set Variable    //label[contains(text(),"Nome da instituição")]/ancestor::div[contains(@class,"label-input")]//input
    Wait Until Element Is Visible    ${xpath}
    Clear Element Text              ${xpath}
    Input Text                      ${xpath}    ${valor}

Selecionar Município
    [Arguments]    ${municipio}
    # Clica na caixa do município para ativar o campo de busca
    ${combo_xpath}=    Set Variable    //label[contains(text(),"Município")]/following-sibling::div[contains(@class,"ant-select")]
    Click Element    ${combo_xpath}
    # Encontra o input de busca dentro do combo
    ${input_xpath}=    Set Variable    ${combo_xpath}//input[@type="search"]
    Wait Until Element Is Visible    ${input_xpath}
    Input Text    ${input_xpath}    ${municipio}
    Sleep    0.5
    # Aguarda o dropdown aparecer e seleciona exatamente o item igual ao texto do parâmetro
    ${option_xpath}=    Set Variable    //div[contains(@class,"ant-select-dropdown") and not(contains(@style,"display: none"))]//div[contains(@class,"ant-select-item-option-content") and normalize-space(text())="${municipio}"]
    Wait Until Element Is Visible    ${option_xpath}    5s
    Click Element    ${option_xpath}
    Sleep    0.5
    Click Element    ${combo_xpath}


Selecionar Data do Plantio
    [Arguments]    ${data_br}
    # Converte do formato brasileiro DD/MM/YYYY para YYYY-MM-DD
    ${data}=    Convert Date    ${data_br}    result_format=%Y-%m-%d    date_format=%d/%m/%Y
    ${ano}=    Convert Date    ${data}    result_format=%Y
    ${mes_num}=    Convert Date    ${data}    result_format=%m
    ${mes}=    Convert To Integer    ${mes_num}
    ${dia_num}=    Convert Date    ${data}    result_format=%d
    ${dia}=    Convert To Integer    ${dia_num}
    Click Element    xpath=//input[@data-testid="date-picker-seeding"]
    Wait Until Element Is Visible    //div[contains(@class,"ant-picker-panel")]
    FOR    ${i}    IN RANGE    24
        ${ano_atual}=    Get Text    //button[contains(@class,"ant-picker-year-btn")]
        Exit For Loop If    '${ano_atual}' == '${ano}'
        ${ano_atual_int}=    Convert To Integer    ${ano_atual}
        ${ano_int}=    Convert To Integer    ${ano}
        Run Keyword If    ${ano_int} > ${ano_atual_int}    Click Element    //button[contains(@class,"ant-picker-header-next-btn")]
        Run Keyword If    ${ano_int} < ${ano_atual_int}    Click Element    //button[contains(@class,"ant-picker-header-prev-btn")]
        Sleep    0.2
    END
    FOR    ${i}    IN RANGE    12
        ${mes_atual}=    Get Text    //button[contains(@class,"ant-picker-month-btn")]
        ${mes_atual_num}=    Evaluate    {'Jan':1, 'January':1,'Feb':2, 'February':2,'Mar':3, 'March':3,'Apr':4, 'April':4,'May':5,'Jun':6, 'June':6,'Jul':7, 'July':7,'Aug':8, 'August':8,'Sep':9, 'September':9,'Oct':10, 'October':10,'Nov':11, 'November':11,'Dec':12, 'December':12}['${mes_atual}']
        Exit For Loop If    ${mes_atual_num} == ${mes}
        Run Keyword If    ${mes} > ${mes_atual_num}    Click Element    //button[contains(@class,"ant-picker-header-next-btn")]
        Run Keyword If    ${mes} < ${mes_atual_num}    Click Element    //button[contains(@class,"ant-picker-header-prev-btn")]
        Sleep    0.2
    END
    Wait Until Element Is Visible    //td[@title="${data}"]
    Click Element    //td[@title="${data}"]
    Wait Until Element Does Not Contain    //body    ant-picker-panel
    ${data_br_out}=    Convert Date    ${data}    result_format=%d/%m/%Y
    Element Attribute Value Should Be    xpath=//input[@data-testid="date-picker-seeding"]    value    ${data_br_out} 

Selecionar Data do Plantio Fiscalização Padrao
    [Arguments]    ${data_br}
    [Documentation]    Seleciona a data no calendário "Date de plantio" do Fiscalização Padrão.

    # Converte a data para o formato necessário
    ${ano}=    Convert Date    ${data_br}    result_format=%Y    date_format=%d/%m/%Y
    ${mes_num}=    Convert Date    ${data_br}    result_format=%m    date_format=%d/%m/%Y
    ${mes}=    Convert To Integer    ${mes_num}
    ${dia_num}=    Convert Date    ${data_br}    result_format=%d    date_format=%d/%m/%Y
    ${dia}=    Convert To Integer    ${dia_num}
    ${data_iso}=    Convert Date    ${data_br}    result_format=%Y-%m-%d    date_format=%d/%m/%Y

    # Abre o calendário
    Click Element    xpath=//label[normalize-space(text())="Date de plantio"]/following-sibling::div//input[@placeholder="Selecione"]
    Wait Until Element Is Visible    //div[contains(@class,"ant-picker-panel")]    timeout=10s

    # Navega até o ano correto
    FOR    ${i}    IN RANGE    24
        ${ano_atual}=    Get Text    //button[contains(@class,"ant-picker-year-btn")]
        Exit For Loop If    '${ano_atual}' == '${ano}'
        ${ano_atual_int}=    Convert To Integer    ${ano_atual}
        ${ano_int}=    Convert To Integer    ${ano}
        Run Keyword If    ${ano_int} > ${ano_atual_int}    Click Element    //button[contains(@class,"ant-picker-header-next-btn")]
        Run Keyword If    ${ano_int} < ${ano_atual_int}    Click Element    //button[contains(@class,"ant-picker-header-prev-btn")]
        Sleep    0.2
    END

    # Navega até o mês correto
    FOR    ${i}    IN RANGE    12
        ${mes_atual}=    Get Text    //button[contains(@class,"ant-picker-month-btn")]
        ${mes_atual_num}=    Evaluate    {'Jan':1, 'January':1,'Feb':2, 'February':2,'Mar':3, 'March':3,'Apr':4, 'April':4,'May':5,'Jun':6, 'June':6,'Jul':7, 'July':7,'Aug':8, 'August':8,'Sep':9, 'September':9,'Oct':10, 'October':10,'Nov':11, 'November':11,'Dec':12, 'December':12}['${mes_atual}']
        Exit For Loop If    ${mes_atual_num} == ${mes}
        Run Keyword If    ${mes} > ${mes_atual_num}    Click Element    //button[contains(@class,"ant-picker-header-next-btn")]
        Run Keyword If    ${mes} < ${mes_atual_num}    Click Element    //button[contains(@class,"ant-picker-header-prev-btn")]
        Sleep    0.2
    END

    # Agora clica no dia
    Wait Until Element Is Visible    //td[@title="${data_iso}"]    timeout=10s
    Click Element    //td[@title="${data_iso}"]
    Wait Until Element Does Not Contain    //body    ant-picker-panel



Selecionar Data do Plantio Fiscalização
    [Arguments]    ${data_br}
    [Documentation]    Seleciona a data no calendário "Date de plantio" apenas se o campo estiver vazio.

    # Encontra o input pelo placeholder (ajuste se necessário para outros idiomas ou placeholders)
    ${valor_atual}=    Get Element Attribute    xpath=//label[normalize-space(text())="Date de plantio"]/following-sibling::div//input[@placeholder="Selecione"]    value
    Log    Valor atual do campo data: ${valor_atual}
    Run Keyword If    '${valor_atual}' != ''    Log    Data já preenchida: ${valor_atual}
    Run Keyword Unless    '${valor_atual}' != ''    Preencher Data do Plantio Calendario    ${data_br}

Preencher Data do Plantio Calendario
    [Arguments]    ${data_br}
    # (Aqui entra sua lógica para converter data e navegar no calendário, igual ao seu script original)
    ${data}=    Convert Date    ${data_br}    result_format=%Y-%m-%d    date_format=%d/%m/%Y
    # Clica no input para abrir o calendário
    Click Element    xpath=//label[normalize-space(text())="Date de plantio"]/following-sibling::div//input[@placeholder="Selecione"]
    Wait Until Element Is Visible    //div[contains(@class,"ant-picker-panel")]
    # Aguarda o botão do ano aparecer, depois navega para o ano/mes/dia desejado (como seu fluxo original)
    # ...
    # Exemplo para clicar no dia (ajuste conforme seu componente):
    Wait Until Element Is Visible    //td[@title="${data}"]
    Click Element    //td[@title="${data}"]
    Wait Until Element Does Not Contain    //body    ant-picker-panel
    ${data_br_out}=    Convert Date    ${data}    result_format=%d/%m/%Y
    Element Attribute Value Should Be    xpath=//label[normalize-space(text())="Date de plantio"]/following-sibling::div//input[@placeholder="Selecione"]    value    ${data_br_out}


Selecionar Data de Colheita
    [Arguments]    ${data_br}
    [Documentation]    Seleciona a data no calendário "Data de colheita" apenas se o campo estiver vazio.

    # Obtém o valor atual do input (pode estar vazio ou já preenchido)
    ${valor_atual}=    Get Element Attribute    xpath=//label[normalize-space(text())="Data de colheita"]/following-sibling::div//input[@placeholder="Selecione"]    value
    Log    Valor atual do campo data de colheita: ${valor_atual}
    Run Keyword If    '${valor_atual}' != ''    Log    Data de colheita já preenchida: ${valor_atual}
    Run Keyword Unless    '${valor_atual}' != ''    Preencher Data de Colheita Calendario    ${data_br}

Preencher Data de Colheita Calendario
    [Arguments]    ${data_br}
    # Garante que o input está visível e clica
    Wait Until Element Is Visible    xpath=//label[normalize-space(text())="Data de colheita"]/../div[contains(@class,"ant-picker")]//input[@placeholder="Selecione"]    timeout=10s
    Click Element    xpath=//label[normalize-space(text())="Data de colheita"]/../div[contains(@class,"ant-picker")]//input[@placeholder="Selecione"]

    # Aguarda o dropdown do calendário abrir
    Wait Until Element Is Visible    //div[contains(@class,"ant-picker-dropdown") and not(contains(@style,"display: none"))]    timeout=10s

    # Aqui segue a lógica para navegar ano/mês e clicar no dia
    # Exemplo para clicar no dia:
    ${data_iso}=    Convert Date    ${data_br}    result_format=%Y-%m-%d    date_format=%d/%m/%Y
    Wait Until Element Is Visible    //td[@title="${data_iso}"]    timeout=10s
    Click Element    //td[@title="${data_iso}"]
    Wait Until Element Does Not Contain    //body    ant-picker-dropdown


Preencher Data de Colheita Padrao
    [Arguments]    ${data_br}
    [Documentation]    Clica no elemento input e insere (cola) o valor passado no parametro.
    # Localiza o elemento input
    ${xpath_data_colheita}=    Evaluate    "//label[text()='Data de colheita']/following-sibling::div//input[@placeholder='Selecione']"
    # Garante que o elemento está visível
    Wait Until Element Is Visible    ${xpath_data_colheita}    timeout=10s
    # Clica no elemento input para focar
    Click Element    ${xpath_data_colheita}
    # Limpa o campo (opcional, caso já tenha algum valor)
    Clear Element Text    ${xpath_data_colheita}
    # Insere o valor no campo
    Input Text    ${xpath_data_colheita}    ${data_br}
     # Envia dois tabs
    Press Key    ${xpath_data_colheita}    \\09
    Sleep    1s
    Press Key    ${xpath_data_colheita}    \\09

Selecionar Vencimento do Contrato Padrao  
     [Arguments]    ${data_br}
    [Documentation]    Clica no elemento input e insere (cola) o valor passado no parametro.
    # Localiza o elemento input
    ${xpath_data_venci_contrato}=    Evaluate    "//label[text()='Vencimento do contrato']/following-sibling::div//input[@placeholder='Selecione']"
    # Garante que o elemento está visível
    Wait Until Element Is Visible    ${xpath_data_venci_contrato}    timeout=10s
    # Clica no elemento input para focar
    Click Element    ${xpath_data_venci_contrato}
    # Limpa o campo (opcional, caso já tenha algum valor)
    Clear Element Text    ${xpath_data_venci_contrato}
    # Insere o valor no campo
    Input Text    ${xpath_data_venci_contrato}    ${data_br}
     # Envia dois tabs
    Press Key    ${xpath_data_venci_contrato}    \\09
    Sleep    1s
    Press Key    ${xpath_data_venci_contrato}    \\09





Selecionar Vencimento do Contrato
    [Arguments]    ${data_br}
    [Documentation]    Seleciona a data no calendário "Vencimento do contrato" apenas se o campo estiver vazio.

    # Obtém o valor atual do input
    ${valor_atual}=    Get Element Attribute    xpath=//label[normalize-space(text())="Vencimento do contrato"]/following-sibling::div//input[@placeholder="Selecione"]    value
    Log    Valor atual do campo vencimento do contrato: ${valor_atual}
    Run Keyword If    '${valor_atual}' != ''    Log    Vencimento do contrato já preenchido: ${valor_atual}
    Run Keyword Unless    '${valor_atual}' != ''    Preencher Vencimento do Contrato Calendario    ${data_br}

Preencher Vencimento do Contrato Calendario
    [Arguments]    ${data_br}
    # Conversão das datas
    ${data}=    Convert Date    ${data_br}    result_format=%Y-%m-%d    date_format=%d/%m/%Y
    ${ano}=    Convert Date    ${data}    result_format=%Y
    ${mes_num}=    Convert Date    ${data}    result_format=%m
    ${mes}=    Convert To Integer    ${mes_num}
    ${dia_num}=    Convert Date    ${data}    result_format=%d
    ${dia}=    Convert To Integer    ${dia_num}
    # Abre o calendário
    Click Element    xpath=//label[normalize-space(text())="Vencimento do contrato"]/following-sibling::div//input[@placeholder="Selecione"]
    Wait Until Element Is Visible    //div[contains(@class,"ant-picker-panel")]
    # Navegação por ano
    FOR    ${i}    IN RANGE    24
        ${ano_atual}=    Get Text    //button[contains(@class,"ant-picker-year-btn")]
        Log    Ano atual no calendário: ${ano_atual}
        Exit For Loop If    '${ano_atual}' == '${ano}'
        ${ano_atual_int}=    Convert To Integer    ${ano_atual}
        ${ano_int}=    Convert To Integer    ${ano}
        Run Keyword If    ${ano_int} > ${ano_atual_int}    Click Element    //button[contains(@class,"ant-picker-header-next-btn")]
        Run Keyword If    ${ano_int} < ${ano_atual_int}    Click Element    //button[contains(@class,"ant-picker-header-prev-btn")]
        Sleep    0.2
    END
    # Navegação por mês
    FOR    ${i}    IN RANGE    12
        ${mes_atual}=    Get Text    //button[contains(@class,"ant-picker-month-btn")]
        ${mes_atual_num}=    Evaluate    {'Jan':1, 'January':1,'Feb':2, 'February':2,'Mar':3, 'March':3,'Apr':4, 'April':4,'May':5,'Jun':6, 'June':6,'Jul':7, 'July':7,'Aug':8, 'August':8,'Sep':9, 'September':9,'Oct':10, 'October':10,'Nov':11, 'November':11,'Dec':12, 'December':12}['${mes_atual}']
        Log    Mês atual no calendário: ${mes_atual}
        Exit For Loop If    ${mes_atual_num} == ${mes}
        Run Keyword If    ${mes} > ${mes_atual_num}    Click Element    //button[contains(@class,"ant-picker-header-next-btn")]
        Run Keyword If    ${mes} < ${mes_atual_num}    Click Element    //button[contains(@class,"ant-picker-header-prev-btn")]
        Sleep    0.2
    END
    # Seleciona o dia
    Wait Until Element Is Visible    //td[@title="${data}"]    timeout=30
    Click Element    //td[@title="${data}"]
    Wait Until Element Does Not Contain    //body    ant-picker-panel
    ${data_br_out}=    Convert Date    ${data}    result_format=%d/%m/%Y
    Element Attribute Value Should Be    xpath=//label[normalize-space(text())="Vencimento do contrato"]/following-sibling::div//input[@placeholder="Selecione"]    value    ${data_br_out}

Preencher Calendario Data do Plantio Fiscalização Padrao
    [Arguments]    ${data_br}
    # Conversão das datas
    ${data}=    Convert Date    ${data_br}    result_format=%Y-%m-%d    date_format=%d/%m/%Y
    ${ano}=    Convert Date    ${data}    result_format=%Y
    ${mes_num}=    Convert Date    ${data}    result_format=%m
    ${mes}=    Convert To Integer    ${mes_num}
    ${dia_num}=    Convert Date    ${data}    result_format=%d
    ${dia}=    Convert To Integer    ${dia_num}
    # Abre o calendário
    Click Element    xpath=//label[normalize-space(text())="Date de plantio"]/following-sibling::div//input[@placeholder="Selecione"]
    Wait Until Element Is Visible    //div[contains(@class,"ant-picker-panel")]
    # Navegação por ano
    FOR    ${i}    IN RANGE    24
        ${ano_atual}=    Get Text    //button[contains(@class,"ant-picker-year-btn")]
        Log    Ano atual no calendário: ${ano_atual}
        Exit For Loop If    '${ano_atual}' == '${ano}'
        ${ano_atual_int}=    Convert To Integer    ${ano_atual}
        ${ano_int}=    Convert To Integer    ${ano}
        Run Keyword If    ${ano_int} > ${ano_atual_int}    Click Element    //button[contains(@class,"ant-picker-header-next-btn")]
        Run Keyword If    ${ano_int} < ${ano_atual_int}    Click Element    //button[contains(@class,"ant-picker-header-prev-btn")]
        Sleep    0.2
    END
    # Navegação por mês
    FOR    ${i}    IN RANGE    12
        ${mes_atual}=    Get Text    //button[contains(@class,"ant-picker-month-btn")]
        ${mes_atual_num}=    Evaluate    {'Jan':1, 'January':1,'Feb':2, 'February':2,'Mar':3, 'March':3,'Apr':4, 'April':4,'May':5,'Jun':6, 'June':6,'Jul':7, 'July':7,'Aug':8, 'August':8,'Sep':9, 'September':9,'Oct':10, 'October':10,'Nov':11, 'November':11,'Dec':12, 'December':12}['${mes_atual}']
        Log    Mês atual no calendário: ${mes_atual}
        Exit For Loop If    ${mes_atual_num} == ${mes}
        Run Keyword If    ${mes} > ${mes_atual_num}    Click Element    //button[contains(@class,"ant-picker-header-next-btn")]
        Run Keyword If    ${mes} < ${mes_atual_num}    Click Element    //button[contains(@class,"ant-picker-header-prev-btn")]
        Sleep    0.2
    END
    # Seleciona o dia
    Wait Until Element Is Visible    //td[@title="${data}"]    timeout=30
    Click Element    //td[@title="${data}"]
    Wait Until Element Does Not Contain    //body    ant-picker-panel
    ${data_br_out}=    Convert Date    ${data}    result_format=%d/%m/%Y
    Element Attribute Value Should Be    xpath=//label[normalize-space(text())="Vencimento do contrato"]/following-sibling::div//input[@placeholder="Selecione"]    value    ${data_br_out}

Gerenciar Modal Salvar Geometria BACEN
    [Arguments]    ${opcao}
    [Documentation]    Gerencia o modal "Deseja salvar a geometria relacionada ao código BACEN na sua base?".
    Wait Until Element Is Visible    //div[contains(@class,"ant-modal-footer")]    timeout=10s
    ${xpath_sim}=    Set Variable    //div[contains(@class,"ant-modal-footer")]//button[span[normalize-space(text())="Sim"]]
    ${xpath_nao}=    Set Variable    //div[contains(@class,"ant-modal-footer")]//button[span[normalize-space(text())="Não"]]
    Run Keyword If    '${opcao}' == 'Sim'    Click Element    ${xpath_sim}
    ...    ELSE IF    '${opcao}' == 'Não'    Click Element    ${xpath_nao}
    ...    ELSE    Fail    Opção "${opcao}" inválida. Use "Sim" ou "Não".




Marcar Checkbox Assinar Relatorios Com Modal

    [Documentation]    Marca o checkbox "Assinar relatórios" e, se aparecer o modal, clica em "Cancel" ou "OK" conforme o parâmetro.

    # Clica no checkbox "Assinar relatórios"
    Click Element    //label[contains(@class, "ar-checkbox-multiline")]


Tratar Modal Assinatura Relatorio
    [Arguments]    ${acao_modal}
    [Documentation]    Se o modal de assinatura aparecer, clica em OK ou Cancel conforme o parâmetro. Não falha se o modal não aparecer.

    ${modal_apareceu}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    //div[@class="ant-modal-footer"]//button[span[text()="Cancel"]]    timeout=3

    Run Keyword If    ${modal_apareceu} and '${acao_modal}' == 'OK'
    ...    Click Element    //div[@class="ant-modal-footer"]//button[span[text()="OK"]]
    ...    ELSE IF    ${modal_apareceu} and '${acao_modal}' == 'Cancel'
    ...    Click Element    //div[@class="ant-modal-footer"]//button[span[text()="Cancel"]]
    ...    ELSE IF    ${modal_apareceu}
    ...    Fail    Opção de modal inválida: "${acao_modal}". Use "OK" ou "Cancel".
    ...    ELSE
    ...    Log    Modal não apareceu.


Selecionar Language
    [Arguments]    ${idioma}
    [Documentation]    Seleciona o radio button da linguagem desejada: 
    ...    "Português", "Inglês" ou "Espanhol".
    # Normaliza o argumento para facilitar a comparação
    ${idioma_normalizado}=    Convert To Lowercase    ${idioma}

    # Define os valores/labels possíveis
    ${lang_value}=    Set Variable If    '${idioma_normalizado}'=='português'    pt_BR
    ...    '${idioma_normalizado}'=='inglês'    en
    ...    '${idioma_normalizado}'=='espanhol'    es
    ...    ELSE    NONE

    Run Keyword If    '${lang_value}'=='NONE'
    ...    Fail    Idioma "${idioma}" inválido. Use "Português", "Inglês" ou "Espanhol".

    # Monta o XPath para o input radio pelo valor
    ${xpath_radio}=    Set Variable    //div[@data-testid="radio-group-languages"]//input[@type="radio" and @value="${lang_value}"]

    # Clica no radio desejado
    Click Element    ${xpath_radio}

Clicar Botao Baixar CSV Exemplo
    [Documentation]    Clica no link "Baixar CSV exemplo" identificado pela classe link-download-csv.
    Click Element    //a[contains(@class, "link-download-csv")]

Selecionar Opção RenovaBio
    [Arguments]    ${tipo}    # Monitoramento    Certificação 
    ${tipo_lower}=    Convert To Lowercase    ${tipo}
    Run Keyword If    '${tipo_lower}' == 'certificação'    Click Element    //input[@value='RENOVABIO_CERTIFICATION']
    ...    ELSE IF    '${tipo_lower}' == 'monitoramento'    Click Element    //input[@value='RENOVABIO_MONITORING']
    ...    

Validar Mensagem de Erro no Campo data de corte
    [Arguments]    ${msg}
    Sleep    1s
    Element Should Be Visible    css=#cutoffDate_help .ant-form-item-explain-error
    Element Text Should Be    css=#cutoffDate_help .ant-form-item-explain-error    ${msg}

Validar Mensagem de Erro no Campo Safra
    [Arguments]    ${msg}
    Sleep    1s
    Element Should Be Visible    css=#cropYear_help .ant-form-item-explain-error
    Element Text Should Be    css=#cropYear_help .ant-form-item-explain-error    ${msg}

Validar Mensagem de Erro no Campo Idioma
    [Arguments]    ${msg}
    Sleep    1s
    Element Should Be Visible    css=#language_help .ant-form-item-explain-error
    Element Text Should Be    css=#language_help .ant-form-item-explain-error    ${msg}

Selecionar Método de Solicitação
    [Arguments]    ${metodo}
    # ${metodo} deve ser "MANUAL" ou "BATCH"
    ${texto}=    Set Variable If    '${metodo}'=='MANUAL'    Manualmente    Em lote
    Wait Until Element Is Visible    xpath=//div[@data-testid="radio-group-request-methods"]    timeout=15s
    Wait Until Element Is Visible    xpath=//div[@data-testid="radio-group-request-methods"]//span[normalize-space(text())="${texto}"]    timeout=10s
    Click Element    xpath=//div[@data-testid="radio-group-request-methods"]//span[normalize-space(text())="${texto}"]
    Sleep    0.5

Selecionar Tipo de Resolução
  [Arguments]    ${tipo}
    # ${tipo} deve ser "Resolução BACEN" ou "Padrão"
    Wait Until Element Is Visible    xpath=//div[contains(@class,"ant-radio-group")]//span[normalize-space(text())="${tipo}"]    timeout=15s
    Scroll Element Into View         xpath=//div[contains(@class,"ant-radio-group")]//span[normalize-space(text())="${tipo}"]
    Click Element                   xpath=//div[contains(@class,"ant-radio-group")]//span[normalize-space(text())="${tipo}"]
    Sleep    0.5

Selecionar Area de Interesse
    [Arguments]    ${tipo}
    # ${tipo} deve ser "CPF/CNPJ" ou "Código CAR"
    Wait Until Element Is Visible    xpath=//div[@data-testid="radio-group-batch-choose-document-type"]    timeout=10s
    # Aguarda o texto do radio estar visível
    Wait Until Element Is Visible    xpath=//div[@data-testid="radio-group-batch-choose-document-type"]//span[normalize-space(text())="${tipo}"]    timeout=5s
    # Clica no texto do radio desejado
    Click Element    xpath=//div[@data-testid="radio-group-batch-choose-document-type"]//span[normalize-space(text())="${tipo}"]
    Sleep    0.5


Clicar Botão do Modal
    # deve ser "OK" ou "Cancel"
    [Arguments]    ${botao}
    ${xpath}=    Set Variable    //div[contains(@class,"ant-modal-footer")]//button[span/text()="${botao}"]
    Wait Until Element Is Visible    ${xpath}
    Click Element    ${xpath}