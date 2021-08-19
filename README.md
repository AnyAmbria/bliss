
# Programas necessários para emular o projeto.


- Xcode versão -> 12.5.1

- Swift versão -> 5.0

- Cocoapods versão -> 1.10.1

- MacOs versão -> Big Sur (11.2.3)

​

# Bibliotecas / abstrações usadas:


- Moya: para fazer as requests de APIs

- Bindable: abstração do RxSwift para fornecer reatividade

- Arquitetura: MVVM-C (Model-View-ViewModel com coordinator para cuidar da navegação entre telas)

​

# Passos para clonar e visualizar o projeto.


 - Clone o projeto em seu Mac.

 - Vá pasta onde se encontra o arquivo Emoji.xcodeproj.

 - Abra o arquivo Emoji.xcworkspace.

​

 # Protótipo
 

 Como primeiro versão do protótipo, foi desenvolvida uma Home com alguns botões, um campo de texto e uma ImageView. Focando mais em uma experiência divertida de ver vários emojis e procurar avatars.

  ​

# Ideias para próximas features


- Implementar paginação na tela do “Apple Repos”

- Melhorar as tratativas de erros e telas vazias, assim como criar as telas de loading para melhorar a experiencia do usuário.

- Melhorar o layout da Home, migrando alguns botões para uma tabBar e colocando ícones no lugar de textos.

- Retirar a pasta Pods do projeto.

- Implementar uma CI.

- Construir testes unitarios.

​

# Considerações finais


- O protótipo foi criado com a arquitetura MVVM-C, com layout flexível e componentes, para evitar repetição de código.

- Foi utilizado viewCode nativo para a construção dos layouts, afim de deixar o projeto mais rápido e evitar conflitos de merge quando ocorrer a evolução do protótipo.

- Foi utilizado uma classe chamada Bindable que implementa uma das partes mais legais do RxSwift: Observables, mas sem a necessidade de importar um framework tão grande e poderoso, mantendo um projeto pequeno limpo e viável para entregas com um prazo menor.


