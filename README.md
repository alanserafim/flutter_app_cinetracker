# Aplicativo CineTrack - Seu descobridor de filmes e séries

## Projeto da disciplina

### Curso:
* Pós Graduação em Desenvolvimento de aplicativos móveis - PUCPR

### Disciplinas:
* Desenvolvimento Mobile Professional

### Imagens do Projeto

    <img src="./Docs/screens.png" width="1080px" alt="Telas do projeto"/><br>

## Ferramentas
As seguintes ferramentas foram usadas na construção do projeto:

### 👉 **_Mobile_**

- Flutter
- Dart
- API do The Movie Database (TMDB)

### 👉 **_Desenvolvimento Geral_**

- Editor:
    - Android Studio
- Prototipagem:
    - Figma
- Reuniões:
    - Teams
- Diagramas:
    - Draw.io

## Introdução

Este projeto possui o objetivo principal **implementar um aplicativo de gerenciamento de filmes e séries**.


## Análise técnica

### Requisitos Funcionais

* **RF01** - Busca Híbrida: O usuário deve buscar por títulos, e o app deve retornar resultados mistos (filmes e séries) usando o endpoint Multi-Search do TMDb.
* **RF02** - Detalhes Específicos: O app deve identificar se o item é um filme ou série e exibir detalhes pertinentes (ex: "Duração" para filmes e "Número de Temporadas/Episódios" para séries).
* **RF03** - Biblioteca Unificada: O usuário deve poder salvar ambos na mesma lista de "Interesses" (Watchlist), diferenciando-os visualmente por ícones ou etiquetas.
* **RF04** - Recomendação Multimídia (IA): O usuário fornece seus gostos, e a IA do Gemini deve sugerir uma mistura equilibrada de filmes e séries.

### Fluxo de Navegação

Utilizaremos a estrutura clássica de abas (Tab Bar):

* **Tab 1 (Descobrir)**: Barra de busca e lista de filmes populares (TMDb).
* **Tab 2 (Assistente IA)**: Campo de chat ou formulário de interesses para gerar recomendações.
* **Tab 3 (Minha Biblioteca)**: Segmented Control entre "Para Assistir" e "Assistidos" (Core Data).
* **View de Detalhes**: Tela comum acessada por qualquer uma das abas acima, mostrando os dados completos do filme.


### Descrição do ambiente técnico

O sistema é composto por um app desenvolvido em Swift e disponibilizado para IOS.
A persistência local foi realizada por meio de banco de dados relacional utilizando o Core Data.
As informações dos filmes e séries são fornecidadas através da integração com a API do The Movie Database (TMDB).
O App fornece sugestões personalizadas através da aplicação de inteligência artificial devido a integração com a API do Google AI Studio.


### Diagrama de Classes de Domínio

A ideia do diagrama de classes de domínio é fornecer um documentação enxuta que será utilizada como ponto de partida para o desenvolvimento do projeto, sem a preocupação com os demais detalhes da UML.

    <img src="./Docs/driagrama_classes.png" width="480px" alt="diagrama de classes"/><br>


### Prototipação

O modelo de prototipação escolhido foi o mockup de alta fidelidade com as principais telas da aplicação.

    ![Prototipação](./Docs/prototipacao.png)

### Links do Projeto

* [TMDB API](https://developer.themoviedb.org/reference/getting-started)
* [Stitch AI Design](https://stitch.withgoogle.com/)
* [Google AI Studio](https://aistudio.google.com/)

## Conceitos básicos

##### Processo de Desenvolvimento de Software - PDS

> O PDS segue a metodologia ágil sendo um abordagem interativa incremental.

### 👨‍💻 Responsável

<table border="0" align="left">
  <tr>
    <td align="center">
      <img src="https://github.com/alanserafim.png" width="160px" alt="Foto do Alan"/><br>
      <sub>
        <a href="https://github.com/alanserafim"> Alan </a>
      </sub>
    </td>
  </tr>
</table>

