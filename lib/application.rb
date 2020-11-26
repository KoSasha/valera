# frozen_string_literal: true

require_relative 'application_context'
require_relative 'valeron'
require_relative 'states/welcome'
require_relative 'states/continue'
require_relative 'states/exit'

class Application
  def run
    context = ApplicationContext.new(Valeron.new)
    state = States::Welcome.new(context)
    until state.is_a? States::Exit
      state.render
      state = state.next
    end
    state.render
  end
end
