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
    ApplicationContext.new valeron: nil
  end

  let(:state) { States::Welcome.new application_context }

  describe '#next' do
    subject { state.next }
    context 'when user inputs "1"' do
      before { allow(IOAdapter).to receive(:read).and_return('1') }
      it { is_expected.to be_a States::Play }
    end

    context 'when user inputs "2"' do
      before { allow(IOAdapter).to receive(:read).and_return('2') }
      it { is_expected.to be_a States::Continue }
    end

    context 'when user inputs "3"' do
      before { allow(IOAdapter).to receive(:read).and_return('3') }
      it { is_expected.to be_a States::Exit }
    end

    context 'when user inputs incorrect integer data' do
      before { allow(IOAdapter).to receive(:read).and_return('4') }
      it { is_expected.to be_a States::Welcome }
    end

    context 'when user inputs incorrect string data' do
      before { allow(IOAdapter).to receive(:read).and_return('pam') }
      it { is_expected.to be_a States::Welcome }
    end
  end
end
