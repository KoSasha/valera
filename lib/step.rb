# frozen_string_literal: true

require_relative './states/play'

class Step
  attr_accessor :title

  def initialize(title)
    @title = title
  end

  def render
    IOAdapter.write ' '
    IOAdapter.write ' actions'
    IOAdapter.write ' '
    IOAdapter.write '1 Go to work'
    IOAdapter.write '2 Drink'
    IOAdapter.write '3 Drink with someone'
    IOAdapter.write '4 Cultural recreation'
    IOAdapter.write '5 Sing in the subway'
    IOAdapter.write '6 Eat'
    IOAdapter.write '7 Sleep in the park'
    IOAdapter.write ' '
    IOAdapter.write '8 Exit'
  end

  def next(application_context)
    send(handle_user_input, application_context)
  end

  def steps
    [
      Step.new('work'),
      Step.new('drink'),
      Step.new('drink_with_someone'),
      Step.new('cultural_recreation'),
      Step.new('subway_sing'),
      Step.new('eat'),
      Step.new('sleep'),
      Step.new('exit')
    ]
  end

  def work(application_context)
    if application_context.valeron.blue.zero?
      application_context.valeron.money += 10
      application_context.valeron.desire_to_live -= 10
      application_context.message = 'now Valera has money for nice things. Enter next step'
    else
      application_context.message = 'Valera is still blue. Valera cannot go to work ' \
                                    'in such a state. Valera needs a little sleep'
    end
  end

  def drink(application_context)
    if application_context.valeron.money >= 5
      application_context.valeron.money -= 5
      application_context.valeron.health -= 5
      application_context.valeron.desire_to_live -= 10
      application_context.valeron.blue += 10
      application_context.message = 'Valera is sad when he drinks alone'
    else
      application_context.message = 'Valera has no money for a drink. He needs to work to make money'
    end
  end

  def drink_with_someone(application_context)
    if application_context.valeron.money >= 10
      application_context.valeron.money -= 5
      application_context.valeron.health -= 5
      application_context.valeron.desire_to_live += 10
      application_context.valeron.blue += 10
      application_context.message = 'desire to live increased'
    else
      application_context.message = 'Valera has no money for a drink with someone. He needs to work to make money'
    end
  end

  def cultural_recreation(application_context)
    if application_context.valeron.money >= 10
      application_context.valeron.money -= 10
      application_context.valeron.desire_to_live += 20
      application_context.valeron.blue += 10
      application_context.valeron.cognition += 15
      application_context.message = 'Valera is inspired'
    else
      application_context.message = 'Valera has no money for a cultural recreation'
    end
  end

  def subway_sing(application_context)
    application_context.valeron.money += 1
    application_context.valeron.desire_to_live += 10
    application_context.message = 'Valera is a great singer'
  end

  def eat(application_context)
    if application_context.valeron.money >= 5
      application_context.valeron.money -= 5
      application_context.valeron.health += 5
      application_context.valeron.desire_to_live += 15
      application_context.message = 'now Valera is not hungry'
    else
      application_context.message = 'Valera has no money for eat. He needs to work to make money'
    end
  end

  def sleep(application_context)
    application_context.valeron.health += 5
    application_context.valeron.desire_to_live += 10
    application_context.valeron.blue = 0 if application_context.valeron.blue != 0
    application_context.message = 'Valera is sober'
  end

  def error(application_context)
    application_context.message = 'Invalid command entered. Try again'
  end

  def exit(application_context)
    application_context.message = 'You can start life from scratch. Or continue the old one.'
    'exit'
  end

  def handle_user_input
    input = IOAdapter.read
    if input.to_i <= 8 && input.to_i.positive?
      steps[input.to_i - 1].title
    else
      'error'
    end
  end
end
