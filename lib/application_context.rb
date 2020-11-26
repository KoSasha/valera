# frozen_string_literal: true

require_relative 'valeron'

class ApplicationContext
  attr_accessor :valeron, :message, :steps_container

  def initialize(valeron)
    @valeron = valeron
    @message = 'Valera wants to act. enter action number'
  end
end
