# frozen_string_literal: true

module Components
  class Menu
    def render
      IOAdapter.write '1. New life'
      IOAdapter.write '2. Continue'
      IOAdapter.write '3. Exit'
      IOAdapter.write ' '
      IOAdapter.write 'choose step number: '
    end

    def handle_input(input)
      item[input.to_i - 1]
    end

    def item
      @item ||= %w[play continue exit]
    end
  end
end
