Rmarkdown para relat�rios, apresenta��es e criar sites
========================================================
autosize: false  
font-family: 'times'
transition-speed: fast
css: mycss.css
transition: none

Maur�cio Garcia de Camargo<br>
<small>camargofurg@gmail.com</small>
<br>
<p>Dispon�vel online em<br>
<small>http://mauricio-camargo.github.io<br></small>

<div class="midright"><div style="margin-left:-0px;margin-top:-75px;"><img style="margin:0px; background-color:transparent; border:0px; box-shadow:none;" src="R.jpg"></img></div></div>

<div class="footer" style="margin-top:-50px;background-color:transparent;"><SPAN STYLE="font-size:80%;font-weight:bold;"><a href="http://www.furg.br"> Universidade Federal do Rio Grande</a><br>31 de agosto de 2016</SPAN></div>

PROGRAMA��O
========================================================
class: small-code

Programas necess�rios durante o curso:

1. Vers�o atual do R  (https://cran.r-project.org)
2. Rstudio vers�o preview (https://www.rstudio.com/products/rstudio/download/preview)  
3. Instalar os pacotes no Rstudio: 
    install.packages("rmarkdown", type = "source")
    install.packages("knitr", type = "source")
4. Compilador LaTeX para gerar arquivos PDF.
    Para Windows: MikTex (http://miktex.org/download)
    Para Linux: Toda distribui��o traz um compilador LaTeX.
    Para Mac OS X: http://www.tug.org/mactex/downloading.html
5. Criar uma conta gratuita no site http://github.com

Pesquisa reprodut�vel
========================================================
class: small-code
incremental: true

***Pesquisa reproduz�vel***: reprodutibilidade � um dos pilares da ci�ncia. Para ser reproduz�vel, a pesquisa precisa fornecer descri��es, dados, c�digos, m�todos computacionais e meios de divulga��o. O Rstudio auxilia em todas essas etapas.

**Duke clinical trial**

Anil Potti *et al*, 2006. Genomic signatures to guide the use of chemotherapeutics. Nature Medicine.

Publicou os resultados de um estudo que otimizava a quimiterapia em indiv�duos com c�ncer. 

Ningu�m conseguir replicar o estudo.

Reprodutibilidade: assunto de Nature em 2008. 

Literate programming
========================================================
class: small-code
incremental: true

***Literate programming***: Programa��o liter�ria (TeX) � um m�todo que combina uma linguagem de programa��o com uma linguagem de documenta��o. Inventada em 1983 por Donald Knuth, liberta o usu�rio da formata��o do documento, usando modelos. Permite controle total sobre o documento. 

**LaTeX** � uma implementa��o do TeX.  
**HTML** � outro exemplo de linguagem de marca��o (markup)

Ambas usam intensamente as marca��es (markup).

**Markdown** minimiza o uso de marca��es.

Evolu��o sobre as linguagens markup
========================================================
class: small-code
incremental: true

**Markdown**: linguagem muito simples e com poucas marca��es, ao contr�rio de HTML e LaTeX, que s�o linguagens markup.

**Rmarkdown**: implementa��o em R de Markdown atrav�s do Rstudio, permitindo a incorpora��o de c�digos do R que s�o executados e os resultados (como gr�ficos) aparecem no documento final. 

**Aplica��es**: Um �nico arquivo Rmarkdown (.Rmd) pode gerar arquivos em PDF, HTML, DOCX, ODT, RTF, que podem ser usados para documenta��o, apresenta��o ou cria��o de sites da internet.

Anatomia de um arquivo Rmarkdown (.Rmd)
========================================================
class: small-code

Para criar um arquivo de Rmarkdown (.Rmd) no Rstudio, v� em:

File>New file>R markdow

Ap�s, escolhe-se uma das op��es de documento, entre HTML, PDF e DOC.

**Metadados**: cabe�alho do arquivo.   
Cont�m informa��es para a compila��o do arquivo Rmd. O �nico comando obrigat�rio nos metadados � output, que especifica um dos arquivos de sa�da (ex: output: html_document).  

Metadados comuns s�o: tittle, author e date.

========================================================
Na folha tem um grande resumo da maioria das fun��es do Rmarkdown. 

# M�os � obra...

Git e Github
========================================================
incremental: true

Git � Sistema de controle de vers�es inventado por Linus Torvalds. Funciona mais como um reposit�rio para nerds.

Github � uma empresa, entre tantas, que criaram ferramentas para facilitar o uso do Git, e oferece servi�os gratu�tos e pagos.

**githu.com** � o reposit�rio de dados.

**github.io** � o servidor de sites gratu�tos da empresa.

O Rstudio consegue se integrar com o Github e gerenciar todas as p�ginas do site, geradas com Rmarkdow. 

E a velocidade. Bem, a velocidade de atualiza��o �, digamos, fant�stica.

Git, Github e o Rstudio
========================================================
incremental: true

A metodologia de trabalho do Github � baseada em projetos.

Os projetos s�o, na verdade, uma s�rie de arquivos que s�o mantidos no reposit�rio e manejados pelo Rstudio.

Para isso, � preciso Clonar o projeto do Github no Rstudio, escolhendo uma pasta que ser� sincronizada entre eles. Qualquer arquivo l� colocado ser� transferido para o Github.

A filosofia � a seguinte: v�rias pessoas podem trabalhar simultaneamente no projeto. Quando come�am a trabalhar, fazem um **PULL**, que � baixar os arquivos do Github.

No andamento do trabalho, volta e meia � dado um **COMMIT**, para bloquear os arquivos em uso por os outros usu�rios.

Git e Github
========================================================
incremental: true

Quando o trabalho termina, � dado um **PUSH** para enviar os arquivos para o Github e esse processo todo � muito r�pido.

Esses projetos n�o servem somente para atualizar o site da internet. 

Servem para armazenar qualquer coisa. N�s, que lidamos com planilhas, c�digos, textos, figuras e mapas temos muito o que nos beneficiar.

Um projeto para cada trabalho, aumentando muito a produtividade.

A ideia � colaborar com outros projetos. Voc� pode clonar qualquer um dos milh�es de projetos do Github.

========================================================

# Github + Rstudio = poder + velocidade

# *Reprodutibilidade* � isso, tudo p�blico, todos colaborando.
