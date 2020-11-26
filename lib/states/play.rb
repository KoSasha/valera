require_relative '../step'
require_relative 'exit'

module States
  class Play < Base
    def render
      system('reset')
      IOAdapter.write "tamagotchi Valeron\n\n score \n\n"
      IOAdapter.write('money: ' << application_context.valeron.money.to_s)
      IOAdapter.write('health: ' << application_context.valeron.health.to_s)
      IOAdapter.write('derise to live: ' << application_context.valeron.desire_to_live.to_s)
      IOAdapter.write('blue: ' << application_context.valeron.blue.to_s)
      IOAdapter.write('cognition: ' << application_context.valeron.cognition.to_s << "\n")
      IOAdapter.write application_context.message
      step.render
    end

    def next
      if application_context.valeron.health <= 0
        return_to_menu
      elsif step.next(application_context).eql? 'exit'
        save_and_return
      else
        self
      end
    end

    def return_to_menu
      application_context.message = 'old Valera is gone'
      application_context.valeron = Valeron.new
      File.delete('continue.json') if File.file?('continue.json')
      Welcome.new(application_context)
    end

    def save_and_return
      save_life
      application_context.valeron = Valeron.new
      Welcome.new(application_context)
    end

    def step
      Step.new('work')
    end
  end
end
