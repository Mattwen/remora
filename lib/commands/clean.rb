module Remora
  module Clean
    extend Discordrb::Commands::CommandContainer
        
      command(:clean, description: 'Cleans messages in this channel.',
                       min_args: 1, required_permissions: [:manage_messages],
                       usage: 'delete <amount>') do |event, amount|
        if event.bot.profile.on(event.server).permission?(:manage_messages,
                                                          event.channel)
          # Try
          begin
            amount = amount.to_i
            next "`Can't delete less than 2 messages.`" if amount < 2

            while amount > 100
              event.channel.prune(100)
              amount -= 100
            end
            
            # event << "`Attempting to delete #{amount} messages`"
            event.channel.prune(amount) if amount >= 2
            event << "`[Success] #{amount} messages were removed`"

            # Catch if old messages could not be deleted
            rescue
              event << "`[Failure] Some messages were too old to remove`"
            ensure
          end
          nil
        end 
    end
  end
end
