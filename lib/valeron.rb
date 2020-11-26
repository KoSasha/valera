class Valeron
  attr_accessor :money, :health, :desire_to_live, :blue, :cognition

  def initialize(money: 0, health: 50, desire_to_live: 0, blue: 0, cognition: 0)
    self.money = money
    self.health = health
    self.desire_to_live = desire_to_live
    self.blue = blue
    self.cognition = cognition
  end
end
