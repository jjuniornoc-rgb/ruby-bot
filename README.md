# 💎 Ruby Discord Bot (`discordrb`)

Um bot para Discord elegante, expressivo e dinâmico escrito em **Ruby** utilizando a biblioteca [`discordrb`](https://github.com/shardlab/discordrb) com suporte nativo a **Slash Commands** (`/ping`).

Totalmente preparado para hospedagem local e nuvem como **Discloud**.

---

## 🚀 Funcionalidades

- ⚡ **Slash Commands Nativos**: Registra comandos de aplicação via API REST do Discord.
- 🏓 **Comando `/ping`**:
  - Tempo de atividade do bot (*Uptime* formatado em horas, minutos e segundos).
  - Embed estilizado na cor Ruby Vermelho com métricas do runtime e versão da linguagem.
- 💎 **Sintaxe Ruby Moderna**: Código limpo, idiomático e com tratamento elegante de eventos.
- ☁️ **Compatível com Discloud**: Arquivo `discloud.config` pronto para deploy na Discloud com 100MB de RAM.
- 🔒 **Variáveis de Ambiente**: Gestão segura com `dotenv`.

---

## 📁 Estrutura do Projeto

```text
ruby-bot/
├── bot.rb             # Código principal do bot e handlers de Slash Commands
├── Gemfile            # Dependências Ruby (discordrb, dotenv)
├── discloud.config    # Arquivo de configuração da Discloud
├── .env.example       # Modelo de variáveis de ambiente
├── .gitignore         # Arquivos ignorados pelo Git
└── README.md          # Documentação do projeto
```

---

## 🛠️ Pré-requisitos

- **Ruby 3.0+** instalado.
- Conta no [Discord Developer Portal](https://discord.com/developers/applications).

---

## ⚙️ Configuração e Instalação Local

### 1. Clonar o Repositório
```bash
git clone https://github.com/jjuniornoc-rgb/ruby-bot.git
cd ruby-bot
```

### 2. Instalar Dependências
```bash
bundle install
```

### 3. Configurar as Variáveis de Ambiente
Copie o arquivo `.env.example` para `.env`:
```bash
cp .env.example .env
```
Edite o arquivo `.env` e insira o seu token:
```env
DISCORD_TOKEN=seu_token_aqui_sem_aspas

# Opcional: ID do seu servidor de testes (para sincronização instantânea)
GUILD_ID=
```

---

## ▶️ Executando o Bot

```bash
ruby bot.rb
```

Ou usando o Bundler:
```bash
bundle exec ruby bot.rb
```

Você verá no console:
```text
==================================================
🤖 Bot Conectado: SeuBot (ID: 1234567890)
⚡ Framework:     discordrb (Ruby)
📡 Servidores:    1
==================================================
✅ Slash Command registrado globalmente!
🟢 Bot em execução! Pressione CTRL+C para encerrar.
```

---

## ☁️ Hospedagem na Discloud

1. Comprima os seguintes arquivos num arquivo `.zip`:
   - `bot.rb`
   - `Gemfile`
   - `discloud.config`
   - `.env`
2. No painel da [Discloud](https://discloudbot.com) ou via CLI da Discloud:
   ```bash
   discloud upload
   ```
3. A Discloud inicializará o bot automaticamente através de `bot.rb`.

---

## 📜 Licença

Distribuído sob a licença MIT. Consulte `LICENSE` para mais informações.
