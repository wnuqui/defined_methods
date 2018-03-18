require 'spec_helper'
require_relative 'fixtures/arithmeter'

RSpec.describe DefinedMethods do
  context 'instance methods' do
    it 'returns public instance methods' do
      metadata = DefinedMethods::Instance.methods_defined_in(Arithmeter)

      expect(metadata[:object_name]).to eq('Arithmeter')
      expect(metadata[:methods]).to eq(%i[add])
      expect(metadata[:private]).to be(false)
      expect(metadata[:protected]).to be(false)
      expect(metadata[:singleton]).to be(false)
    end
  end

  context 'private methods' do
    it 'returns private instance methods' do
      metadata = DefinedMethods::Instance.private_methods_defined_in(Arithmeter)

      expect(metadata[:object_name]).to eq('Arithmeter')
      expect(metadata[:methods]).to eq(%i[do_add])
      expect(metadata[:private]).to be(true)
      expect(metadata[:protected]).to be(false)
      expect(metadata[:singleton]).to be(false)
    end
  end

  context 'protected methods' do
    it 'returns protected instance methods' do
      metadata = DefinedMethods::Instance.protected_methods_defined_in(Arithmeter)

      expect(metadata[:object_name]).to eq('Arithmeter')
      expect(metadata[:methods]).to eq(%i[perform_addition])
      expect(metadata[:private]).to be(false)
      expect(metadata[:protected]).to be(true)
      expect(metadata[:singleton]).to be(false)
    end
  end
end
