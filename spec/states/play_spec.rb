require_relative '../../lib/states/welcome'
require_relative '../../lib/states/continue'
require_relative '../../lib/states/play'
require_relative '../../lib/states/exit'
require_relative '../../lib/states/base'
require_relative '../../lib/components/menu'
require_relative '../../lib/application_context'
require_relative '../../lib/valeron'
require_relative '../../lib/io'

describe States::Welcome do
  let(:application_context) do
    ApplicationContext.new(Valeron.new)
  end

  let(:state) { States::Play.new application_context }

  describe '#next' do
    subject { state.next }
    context 'when Valera is gone' do
      before { application_context.valeron.health = 0 }
      it { is_expected.to be_a States::Welcome }
    end
  end
end
