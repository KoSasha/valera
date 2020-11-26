require_relative '../../lib/states/welcome'
require_relative '../../lib/states/continue'
require_relative '../../lib/states/play'
require_relative '../../lib/states/exit'
require_relative '../../lib/states/base'
require_relative '../../lib/components/menu'
require_relative '../../lib/application_context'
require_relative '../../lib/valeron'

describe States::Continue do
  let(:application_context) do
    ApplicationContext.new(Valeron.new)
  end

  let(:state) { States::Continue.new application_context }

  describe '#next' do
    subject { state.next }
    context 'when Valera continue' do
      it { is_expected.to be_a States::Play }
    end
  end
end
