# frozen_string_literal: true

require_relative 'base'
require_relative 'play'
require_relative '../components/menu'
require_relative '../io'

module States
  class Welcome < Base
    def render
      system('reset')
      IOAdapter.write 'tamagotchi Valeron'
      IOAdapter.write ' '
      IOAdapter.write application_context.message
      IOAdapter.write ' '
      menu.render
    end

    def next
      send "step_#{handle_user_input}"
    end

    def died
      Welcome.new(application_context)
    end

    def step_error
      application_context.message = 'Oops!'
      self
    end

    def handle_user_input
      input = IOAdapter.read
      if input.to_i <= 3 && input.to_i.positive?
        menu.handle_input(input)
      else
        'error'
      end
    end

    def menu
      @menu ||= Components::Menu.new
    end
  end
end
