# Aplicativo `cinetracker` - Seu descobridor de filmes

## Projeto da disciplina

### Curso:
* Pós-Graduação em Desenvolvimento de aplicativos móveis - PUCPR

### Disciplinas:
* Desenvolvimento Mobile Professional

## Ferramentas
As seguintes ferramentas foram usadas na construção do projeto:

### 👉 **_Mobile_**

- Flutter
- Dart
- API do The Movie Database (TMDB)
- Mocktail
- Get It

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

Este projeto possui o objetivo principal **implementar um aplicativo descobridor de filmes**.


## Análise técnica

### Requisitos Funcionais

* **RF01** - Busca: O usuário deve buscar por títulos, e o app deve retornar filmes usando o endpoint TMDb.
* **RF02** - Detalhes Específicos: O app deve exibir detalhes pertinentes como a descrição do filme.
* **RF03** - Exibição de novidades e lançamentos: O app deve exibir filme recentes e lançamentos em tela dedicada.
### Fluxo de Navegação

Utilizaremos a estrutura clássica de abas (Tab Bar):

* **Tab 1 (Filmes)**: Barra de busca e lista de filmes populares (TMDb).
* **Tab 2 (Lançamentos)**: Lista de filmes lançados recentemente.
* **View de Detalhes**: Tela comum acessada por qualquer uma das abas acima, mostrando os dados complementares do filme.

### Descrição do ambiente técnico

O sistema é composto por um app desenvolvido em Flutter e disponibilizado para Android e IOS.
As informações dos filmes são fornecidadas através da integração com a API do The Movie Database (TMDB).

## Evidências avaliativas

### Interface do Projeto

O foco da interface é trazer telas funcionais e intuitivas para o usuário.


<img src="./docs/Telas.png" width="1080px" alt="Telas do projeto"/>


### Clean Code
Foram aplicados princípios de código limpo para garantir legibilidade e manutenção do código.
Entre eles os que mais se destacam são:

>1. Princípio de Responsabilidade Única (SRP - Single Responsibility Principle)

Separação clara de diretórios, cada classe ou arquivo com propósito único e bem definido.

>2. DRY (Don't Repeat Yourself - Não se repita)

Uso de componentes reutilizáveis para evitar repetição de código.

>3. Encapsulamento de Estado

Utilização de atributos privados e métodos públicos para proteger a consistência dos dados sempre
que necessário.

>4. Nomes Significativos (Meaningful Names)

Para evitar a necessidade de comentários explicativos no código todas as variáveis e métodos 
possuem nomes significativos e intuitivos aumentando a legibilidade do código.



### Padrão Arquitetural - MVVM

O padrão arquitetural adotado foi o modelo `View-Model-ViewModel (MVVM)`.

```txt
lib/
├── app/
│   ├── di/                 # Injeção de Dependência
│   ├── helpers/            # Classes auxiliares
│   ├── models/             # Classes de dados 
│   ├── services/           # Classes que realizam chamadas para API
│   └── viewmodels/         # Classes que realizam a lógica de negócio
├── ui/
│   ├── views/              # As telas da aplicação
│   └── widgets/            # Os componentes reutilizáveis
└── main.dart

```

A imagem a seguir exemplifica o padrão `MVVM` aplicado no projeto. 

A model `movie.dart` é responsável por armazenar os dados do filme, 
a view `release.dart` é responsável por renderizar os componentes, 
e a viewmodel `release_viewmodel.dart` é responsável pela lógica de negócio.


<img src="./docs/mvvm.png" width="1080px" alt="Telas do projeto"/><br>

    
### Injeção de Dependência

Com foco em desacoplamento, testabilidade, modularidade e manutenibilidade de código
foi aplicado a injeção de dependência utilizando o pacote `Get It`.

Com o `get_it` criamos um arquivo dedicado exclusivamente a ensinar o aplicativo como construir 
e fornecer as dependências.
A criação da classe abstrata IMovieService garante que qualquer classe que precise de filmes 
não precisa saber como eles são buscados (se é via HTTP, banco de dados local ou mock), 
apenas que os métodos existem.
As ViewModels recebem a dependência pronta através do construtor. A ViewModel solicita um 
IMovieService no momento da sua criação. Ela não sabe instanciar esse serviço, ele apenas o consome.


<img src="./docs/dependency_injection.png" width="1080px" alt="Telas do projeto"/><br>


### Testes unitários
Para garantir a qualidade e funcionalidade do código foi realizado testes unitários com o framework `Flutter Test` e a biblioteca `Mocktail` para simular chamadas da API.


<img src="./docs/Testes.png" width="1080px" alt="Telas do projeto"/><br>


### Design Patterns
Dentre os padrões de projeto utilizados na aplicação se destacam: 

O Padrão criacional `Factory Method`. O padrão Factory fornece uma interface para criar objetos, 
mas permite ocultar a lógica complexa de instanciação.

```dart
// app/models/movie.dart
factory Movie.fromMap(Map<String, dynamic> map) {
  return Movie(
    id: map['id'] as int,
    title: map['title'] as String,
    imageUrl: map['poster_path'] as String,
    releaseDate: map['release_date'] as String,
    overview: map['overview'] as String,
  );
}
```
O uso da palavra-chave factory na classe Movie. Em vez de instanciar o filme e depois preencher os dados, 
a fábrica fromMap recebe o mapa do JSON e "fabrica" uma instância válida de Movie pronta para uso.


Outro Design Pattern utilizado foi o `Singleton`. O Singleton garante que uma classe tenha apenas uma única 
instância em todo o ciclo de vida do aplicativo e fornece um ponto global de acesso a ela.

```dart
// app/di/locator.dart
void setupLocator() {
  getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton<IMovieService>(() => MovieService(getIt()));
}
```

Ao usar registerLazySingleton, dizemos ao get_it para criar o MovieService e o http.Client apenas uma vez. 
Toda a vez que o aplicativo pedir essa dependência, a mesma instância que já está na memória será devolvida.


### Links do Projeto

* [TMDB API](https://developer.themoviedb.org/reference/getting-started)
* [Flutter](https://docs.flutter.dev/)
* [Flutter test](https://docs.flutter.dev/cookbook/testing/unit/introduction)
* [Mocktail](https://pub.dev/packages/mocktail)
* [Get It](https://pub.dev/packages/get_it)


#### Processo de Desenvolvimento de Software - PDS

O PDS segue a metodologia ágil sendo uma abordagem interativa incremental.

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

