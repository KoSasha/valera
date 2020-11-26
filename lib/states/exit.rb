# frozen_string_literal: true

module States
  class Exit < Base
    def render
      IOAdapter.write 'bye'
    end
  end
end
