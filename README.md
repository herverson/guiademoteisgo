# guiademoteisgo

Desafio técnico

<h1>Documentação do Projeto - Guia de motéis Go</h1>
    <h2>Descrição</h2>
    <p>O <strong>Guia de motéis Go</strong> é um aplicativo desenvolvido em Flutter que permite aos usuários navegar e filtrar motéis e suítes. O projeto utiliza o gerenciamento de estado Cubit para controlar as interações e dados da interface.</p>
    <h2>Pacotes Utilizados</h2>
    <p>Os principais pacotes utilizados no projeto são:</p>
    <ul>
        <li><strong>flutter_bloc:</strong> Para gerenciamento de estado com Cubit/Bloc.</li>
        <li><strong>http:</strong> Utilizado para realizar chamadas HTTP e buscar dados da API.</li>
        <li><strong>mockito:</strong> Pacote para realizar os testes.</li>
        <li><strong>get_it:</strong> Pacote para gerenciar as dependências do projeto.</li>
    </ul>
    <h2>Tecnologias Utilizadas</h2>
    <p>As tecnologias principais adotadas no projeto são:</p>
    <ul>
        <li><strong>Flutter:</strong> Framework para criar interfaces nativas de alta performance em Android, iOS e Web.</li>
        <li><strong>Dart:</strong> Linguagem de programação usada com Flutter.</li>
        <li><strong>Cubit/Bloc:</strong> Padrão de gerenciamento de estado que ajuda no controle e previsibilidade do comportamento da aplicação.</li>
    </ul>
    <div class="section">
        <p>
            A aplicação segue a <strong>Arquitetura Limpa (Clean Architecture)</strong>, que visa a separação de responsabilidades e a organização do código em camadas. Cada camada tem um papel específico no fluxo de dados e na interação com a interface de usuário. Essa arquitetura facilita a testabilidade, manutenção e evolução do código.
        </p>
    </div>
   
---

### Estrutura do Projeto com Clean Architecture

O projeto está organizado seguindo os princípios da **Clean Architecture**, que divide o código em camadas bem definidas para garantir modularidade, testabilidade e manutenibilidade. Abaixo está a explicação de cada pasta:

---

#### 1. **`lib/`**
   - **Pasta raiz do projeto**: Contém todo o código-fonte da aplicação, organizado em camadas seguindo a Clean Architecture.

---

#### 2. **`core/`**
   - **Funcionalidades globais e compartilhadas**:
     - Contém código reutilizável que é usado em várias partes do projeto.
     - Inclui:
       - **`error/`**: Definições de erros e falhas globais.
       - **`usecases/`**: Implementações de casos de uso genéricos que podem ser reutilizados em diferentes partes do projeto.

---

#### 3. **`data/`**
   - **Camada de Dados**:
     - Responsável por lidar com a obtenção e manipulação de dados.
     - Dividida em:
       - **`datasources/`**: Contém as fontes de dados, como APIs ou bancos de dados.
       - **`models/`**: Modelos de dados usados para mapear informações vindas das fontes de dados.
       - **`repositories_impl/`**: Implementações concretas dos repositórios definidos na camada de domínio.

---

#### 4. **`domain/`**
   - **Camada de Domínio**:
     - Contém a lógica de negócio central da aplicação.
     - Dividida em:
       - **`entities/`**: Define as entidades do domínio, que representam os conceitos principais do negócio.
       - **`models/`**: Modelos de dados específicos do domínio.
       - **`repositories/`**: Interfaces que definem como os dados devem ser acessados.
       - **`usecases/`**: Casos de uso que encapsulam a lógica de negócio.

---

#### 5. **`presentation/`**
   - **Camada de Apresentação**:
     - Responsável pela interface do usuário e interação com o usuário.
     - Dividida em:
       - **`bloc/`**: Contém a lógica de gerenciamento de estado usando o padrão BLoC.
       - **`components/`**: Widgets reutilizáveis que compõem a interface do usuário.
       - **`pages/`**: Telas da aplicação, como a página inicial e a página de detalhes do motel.

---

#### 6. **`injection_container.dart`**
   - **Injeção de Dependências**:
     - Configura e gerencia as dependências do projeto usando um contêiner de injeção de dependências (como `get_it`).

---

#### 7. **`main.dart`**
   - **Ponto de Entrada da Aplicação**:
     - Arquivo principal que inicializa a aplicação Flutter.

---

#### 8. **`test/`**
   - **Testes**:
     - Contém os testes unitários e de integração do projeto.
     - Organizado em subpastas que espelham a estrutura do projeto:
       - **`data/`**: Testes relacionados à camada de dados.
       - **`domain/`**: Testes relacionados à camada de domínio.
       - **`presentation/`**: Testes relacionados à camada de apresentação.

---

#### 9. **`linux/` e `macos/`**
   - **Configurações de Plataforma**:
     - Contém arquivos de configuração específicos para as plataformas Linux e macOS.

---

### Resumo das Camadas da Clean Architecture

1. **Camada de Domínio** (`domain/`):
   - Contém a lógica de negócio central.
   - Independente de frameworks e bibliotecas externas.
   - Define entidades, casos de uso e interfaces de repositórios.

2. **Camada de Dados** (`data/`):
   - Implementa as interfaces definidas na camada de domínio.
   - Lida com a obtenção e persistência de dados.
   - Inclui fontes de dados (APIs, bancos de dados) e modelos de dados.

3. **Camada de Apresentação** (`presentation/`):
   - Responsável pela interface do usuário.
   - Utiliza o padrão BLoC para gerenciamento de estado.
   - Contém widgets reutilizáveis e telas da aplicação.

4. **Camada de Core** (`core/`):
   - Funcionalidades globais e compartilhadas.
   - Inclui erros, falhas e casos de uso genéricos.

5. **Testes** (`test/`):
   - Garante a qualidade do código através de testes unitários e de integração.

---

### Benefícios da Estrutura

- **Separação de Responsabilidades**: Cada camada tem uma responsabilidade clara, o que facilita a manutenção e o entendimento do código.
- **Testabilidade**: A lógica de negócio está isolada, permitindo testes unitários e de integração mais eficazes.
- **Escalabilidade**: A estrutura modular facilita a adição de novas funcionalidades.
- **Independência de Frameworks**: A camada de domínio não depende de frameworks externos, o que torna o código mais flexível.

---
 <h2>Configuração do Ambiente</h2>
    <h3>Pré-requisitos</h3>
    <ul>
      <li>Flutter SDK instalado (versão 3.0 ou superior).</li>
      <li>Dart SDK instalado (versão 2.17 ou superior).</li>
    </ul>
    <h3>Passos para Executar o Projeto</h3>
    <ol>
      <li><strong>Clone o repositório:</strong>
        <pre><code>git clone https://github.com/herverson/guiademoteisgo.git
cd guiademoteisgo</code></pre>
      </li>
      <li><strong>Instale as dependências:</strong>
        <pre><code>flutter pub get</code></pre>
      </li>
      <li><strong>Execute o aplicativo:</strong>
        <pre><code>flutter run</code></pre>
      </li>
      <li><strong>Execute os testes:</strong>
        <pre><code>flutter test</code></pre>
      </li>
    </ol>
