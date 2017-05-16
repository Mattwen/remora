# Gem
require 'discordrb'

module Remora
    
    # Load ruby modules
    bot = Discordrb::Commands::CommandBot.new token: 'XXXXXXXXXXXXXXX', client_id: 313927712811122689, prefix: '!'

    # Gets the commands directory and ensures each command module is loaded
    Dir["#{File.dirname(__FILE__)}/commands/*.rb"].each { |r| require_relative r ; puts "Loaded rb: #{r}" }

    # Displays Ruby Version
    puts "Ruby Version: #{RUBY_VERSION}"

    # List of modules, only one for now
    modules = [
        Clean
    ]

    # Loop through modules
    modules.each { |m| bot.include! m }

    # Run 
    bot.run

    # Exit
    at_exit do
        puts 'Shutting down..'
    end
end