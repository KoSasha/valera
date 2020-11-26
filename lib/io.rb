# frozen_string_literal: true

require_relative 'valeron'
require 'json'

class IOAdapter
  def self.write(str)
    puts str
  end

  def self.read
    gets.chomp
  end

  def self.serialize(valeron)
    {
      'money' => valeron.money,
      'health' => valeron.health,
      'desire_to_live' => valeron.desire_to_live,
      'blue' => valeron.blue,
      'cognition' => valeron.cognition
    }.to_json
  end

  def self.deserialize(valeron, string)
    data = JSON.parse(string)
    valeron.money = data['money']
    valeron.health = data['health']
    valeron.desire_to_live = data['desire_to_live']
    valeron.blue = data['blue']
    valeron.cognition = data['cognition']
  end
end
