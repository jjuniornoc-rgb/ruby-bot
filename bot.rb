#!/usr/bin/env ruby
# frozen_string_literal: true

require 'discordrb'
require 'dotenv'
require 'time'

# Carrega variáveis do arquivo .env
Dotenv.load

TOKEN = ENV['DISCORD_TOKEN']
GUILD_ID = ENV['GUILD_ID'] && !ENV['GUILD_ID'].strip.empty? ? ENV['GUILD_ID'].strip.to_i : nil

if TOKEN.nil? || TOKEN.strip.empty?
  warn '❌ ERRO: DISCORD_TOKEN não foi informado no arquivo .env'
  exit 1
end

bot = Discordrb::Bot.new(token: TOKEN)
start_time = Time.now

# Registro do Slash Command (/ping)
bot.register_application_command(:ping, 'Responde com Pong e métricas de latência do bot em Ruby!', server_id: GUILD_ID)

# Manipulador do comando /ping
bot.application_command(:ping) do |event|
  uptime_sec = (Time.now - start_time).to_i
  uptime_hours = uptime_sec / 3600
  uptime_min = (uptime_sec % 3600) / 60
  uptime_rem_sec = uptime_sec % 60
  uptime_str = "#{uptime_hours}h #{uptime_min}m #{uptime_rem_sec}s"

  event.respond(embeds: [
    Discordrb::Webhooks::Embed.new(
      title: '🏓 Pong! Estatísticas do Bot (Ruby)',
      description: 'Bot em execução com elegância e dinamismo em **Ruby**!',
      color: 0xCC342D, # Ruby Red
      timestamp: Time.now.utc,
      fields: [
        Discordrb::Webhooks::EmbedField.new(name: '⏱️ Tempo Ativo (Uptime)', value: "`#{uptime_str}`", inline: true),
        Discordrb::Webhooks::EmbedField.new(name: '💎 Framework', value: '`discordrb 3.5+`', inline: true),
        Discordrb::Webhooks::EmbedField.new(name: '🟢 Status', value: '`Online & Operacional`', inline: true),
        Discordrb::Webhooks::EmbedField.new(name: '⚙️ Versão Ruby', value: "`v#{RUBY_VERSION}`", inline: true),
        Discordrb::Webhooks::EmbedField.new(name: '⚡ Plataforma', value: "`#{RUBY_PLATFORM}`", inline: true)
      ],
      footer: Discordrb::Webhooks::EmbedFooter.new(
        text: "Solicitado por #{event.user.name}",
        icon_url: event.user.avatar_url
      )
    )
  ])
end

bot.ready do
  puts '=================================================='
  puts "🤖 Bot Conectado: #{bot.profile.username} (ID: #{bot.profile.id})"
  puts '⚡ Framework:     discordrb (Ruby)'
  puts "📡 Servidores:    #{bot.servers.size}"
  puts '=================================================='
  if GUILD_ID
    puts "✅ Slash Command registrado no servidor [#{GUILD_ID}]!"
  else
    puts '✅ Slash Command registrado globalmente!'
  end
  puts '🟢 Bot em execução! Pressione CTRL+C para encerrar.'
end

# Inicia o bot
bot.run
