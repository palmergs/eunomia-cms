require 'rails_helper'
require 'normalizer'

RSpec.describe Normalizer, as: :lib do
  it 'is a singleton' do
    expect(Normalizer.instance).to_not be_nil
    expect { Normalizer.new }.to raise_error
  end

  describe '#normalize' do
    let(:norm) { Normalizer.instance }
    it 'strips leading and trailing whitespace' do
      expect(norm.normalize('   test    ')).to eq('test')
    end

    it 'merges duplicate dot and dashes' do
      expect(norm.normalize('this--is..a--test')).to eq('this-is.a-test')
    end

    it 'leaves underscores alone' do
      expect(norm.normalize('___underscore_test___')).to eq('___underscore_test___')
    end

    it 'converts other punctuation and spaces to dashes' do
      expect(norm.normalize('"this \'is\' a test!!!?"')).to eq('-this-is-a-test-')
    end

    it 'returns nil if string is nil or empty' do
      expect(norm.normalize(nil)).to be_nil
      expect(norm.normalize('')).to be_nil
      expect(norm.normalize("\n")).to be_nil
      expect(norm.normalize(" ")).to be_nil
    end
  end
end
