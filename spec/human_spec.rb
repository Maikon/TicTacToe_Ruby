require 'human'

describe Human do
  let(:human) { Human.new }

  context '#set_name' do
    it 'sets the name for the player' do
      expect(human.name).to eq nil
      human.set_name('Joe')
      expect(human.name).to eq 'Joe'
    end
  end

  context '#set_mark' do
    it 'sets the mark for the player' do
      expect(human.mark).to eq nil
      human.set_mark('X')
      expect(human.mark).to eq 'X'
    end
  end
end
