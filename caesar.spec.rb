require_relative 'caesar'

RSpec.describe '#cycle_through' do

  context 'when index grows bigger than ceiling' do
    it 'wraps around to floor' do
      floor, ceiling, index, shift = 1,3,2,2
      index = cycle_through(floor, ceiling, index, shift)
      expect(index).to eql 1
    end
  end

  context 'when index shrinks smaller than floor' do
    it 'wraps around to ceiling' do
      floor, ceiling, index, shift = 1,3,2,-2
      index = cycle_through(floor, ceiling, index, shift)
      expect(index).to eql 3
    end
  end
end

RSpec.describe '#caesar_cipher' do

  context 'when given a phrase and a shift' do

    it 'shifts all letters' do
      word = 'hello world'
      result = caesar_cipher word, 5
      expect(result).to eql("mjqqt btwqi")
    end

    it 'shifts numbers' do
      word = 'Hello World 2!'
      result = caesar_cipher word, 5
      expect(result).to eql("Mjqqt Btwqi 7!")
    end

    it 'mantains caps' do
      word = 'Hello World'
      result = caesar_cipher word, 5
      expect(result).to eql("Mjqqt Btwqi")
    end

    it 'mantains symbols' do
      word = 'Hello World!'
      result = caesar_cipher word, 5
      expect(result).to eql("Mjqqt Btwqi!")
    end

    it 'mantains word on zero shift' do
      word = 'Hello World 2!'
      result = caesar_cipher word, 0
      expect(result).to eql("Hello World 2!")
    end

    it 'works on negative shift' do
      word = 'Hello World 2!'
      result = caesar_cipher word, -21
      expect(result).to eql("Mjqqt Btwqi 1!")
    end

    it 'reverts cyphered words' do
      word = 'Mjqqt Btwqi 1!'
      result = caesar_cipher word, 21
      expect(result).to eql("Hello World 2!")
    end

  end
end