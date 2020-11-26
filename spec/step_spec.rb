require_relative '../lib/states/welcome'
require_relative '../lib/states/continue'
require_relative '../lib/states/play'
require_relative '../lib/states/exit'
require_relative '../lib/states/base'
require_relative '../lib/application_context'
require_relative '../lib/valeron'
require_relative '../lib/io'

describe Step do
  let(:application_context) do
    ApplicationContext.new(Valeron.new)
  end

  let(:step) { Step.new 'work' }

  describe '#next' do
    subject { step.next(application_context) }
    context 'when user inputs "1"' do
      before { allow(IOAdapter).to receive(:read).and_return('1') }
      it { expect(subject).to eq 'now Valera has money for nice things. Enter next step' }
    end

    context 'when user inputs "2"' do
      before { allow(IOAdapter).to receive(:read).and_return('2') }
      it { expect(subject).to eq 'Valera has no money for a drink. He needs to work to make money' }
    end

    context 'when user inputs "3"' do
      before { allow(IOAdapter).to receive(:read).and_return('3') }
      it { expect(subject).to eq 'Valera has no money for a drink with someone. He needs to work to make money' }
    end

    context 'when user inputs "4"' do
      before { allow(IOAdapter).to receive(:read).and_return('4') }
      it { expect(subject).to eq 'Valera has no money for a cultural recreation' }
    end

    context 'when user inputs "5"' do
      before { allow(IOAdapter).to receive(:read).and_return('5') }
      it { expect(subject).to eq 'Valera is a great singer' }
    end

    context 'when user inputs "6"' do
      before { allow(IOAdapter).to receive(:read).and_return('6') }
      it { expect(subject).to eq 'Valera has no money for eat. He needs to work to make money' }
    end

    context 'when user inputs "7"' do
      before { allow(IOAdapter).to receive(:read).and_return('7') }
      it { expect(subject).to eq 'Valera is sober' }
    end

    context 'when user inputs "8"' do
      before { allow(IOAdapter).to receive(:read).and_return('8') }
      it { expect(subject).to eq 'exit' }
    end

    context 'when user inputs invalid integer data' do
      before { allow(IOAdapter).to receive(:read).and_return('9') }
      it { expect(subject).to eq 'Invalid command entered. Try again' }
    end

    context 'when user inputs invalid string data' do
      before { allow(IOAdapter).to receive(:read).and_return('pom') }
      it { expect(subject).to eq 'Invalid command entered. Try again' }
    end
  end

  describe '#work' do
    subject { step.work(application_context) }
    context 'when blue == 0' do
      it { expect(subject).to eq 'now Valera has money for nice things. Enter next step' }
    end
    context 'when blue != 0' do
      before { application_context.valeron.blue += 5 }
      it {
        expect(subject).to eq 'Valera is still blue. Valera cannot go to work in such a state.' \
                                 ' Valera needs a little sleep'
      }
    end
  end

  describe '#drink' do
    subject { step.drink(application_context) }
    context 'when money != 0' do
      before { application_context.valeron.money += 5 }
      it { expect(subject).to eq 'Valera is sad when he drinks alone' }
    end
    context 'when money == 0' do
      it { expect(subject).to eq 'Valera has no money for a drink. He needs to work to make money' }
    end
  end

  describe '#drink_with_someone' do
    subject { step.drink_with_someone(application_context) }
    context 'when money != 0' do
      before { application_context.valeron.money += 10 }
      it { expect(subject).to eq 'desire to live increased' }
    end
    context 'when money == 0' do
      it { expect(subject).to eq 'Valera has no money for a drink with someone. He needs to work to make money' }
    end
  end

  describe '#cultural_recreation' do
    subject { step.cultural_recreation(application_context) }
    context 'when money != 0' do
      before { application_context.valeron.money += 10 }
      it { expect(subject).to eq 'Valera is inspired' }
    end
    context 'when money == 0' do
      it { expect(subject).to eq 'Valera has no money for a cultural recreation' }
    end
  end

  describe '#subway_sing' do
    subject { step.subway_sing(application_context) }
    context 'when user inputs' do
      it { expect(subject).to eq 'Valera is a great singer' }
    end
  end

  describe '#eat' do
    subject { step.eat(application_context) }
    context 'when money != 0' do
      before { application_context.valeron.money += 5 }
      it { expect(subject).to eq 'now Valera is not hungry' }
    end
    context 'when money == 0' do
      it { expect(subject).to eq 'Valera has no money for eat. He needs to work to make money' }
    end
  end

  describe '#sleep' do
    subject { step.sleep(application_context) }
    context 'sleep' do
      it { expect(subject).to eq 'Valera is sober' }
    end
  end
end
