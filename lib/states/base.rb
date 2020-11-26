# frozen_string_literal: true

module States
  class Base
    attr_accessor :application_context

    def initialize(application_context)
      @application_context = application_context
    end

    def render; end

    def next; end

    def save_life
      File.open('continue.json', 'w') { |f| f.write(IOAdapter.serialize(application_context.valeron)) }
    end

    def step_play
      Play.new application_context
    end

    def step_exit
      Exit.new application_context
    end

    def step_continue
      Continue.new application_context
    end
  end
end
