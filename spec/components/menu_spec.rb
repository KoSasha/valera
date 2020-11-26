require_relative '../../lib/components/menu'
require_relative '../../lib/application_context'
require_relative '../../lib/valeron'
require_relative '../../lib/io'

describe Components::Menu do
  let(:application_context) do
    ApplicationContext.new(Valeron.new)
  end

  let(:menu) { Components::Menu.new }

  it '#handle_input when input 1' do
    test_step = menu.handle_input(1)
    expect(test_step).to eq('play')
  end

  it '#handle_input when input 2' do
    test_step = menu.handle_input(2)
    expect(test_step).to eq('continue')
  end

  it '#handle_input when input 3' do
    test_step = menu.handle_input(3)
    expect(test_step).to eq('exit')
  end
end
