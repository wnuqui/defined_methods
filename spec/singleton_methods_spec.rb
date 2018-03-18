require 'spec_helper'
require_relative 'fixtures/raiser'

RSpec.describe DefinedMethods do
  context 'singleton methods' do
    it 'returns public singleton methods' do
      metadata = DefinedMethods::Singleton.methods_defined_in(Raiser)

      expect(metadata[:object_name]).to eq('Raiser')
      expect(metadata[:methods]).to eq(%i[do])
      expect(metadata[:private]).to be(false)
      expect(metadata[:protected]).to be(false)
      expect(metadata[:singleton]).to be(true)
    end
  end

  context 'private methods' do
    it 'returns private singleton methods' do
      metadata = DefinedMethods::Singleton.private_methods_defined_in(Raiser)

      expect(metadata[:object_name]).to eq('Raiser')
      expect(metadata[:methods]).to eq(%i[perform_raising])
      expect(metadata[:private]).to be(true)
      expect(metadata[:protected]).to be(false)
      expect(metadata[:singleton]).to be(true)
    end
  end

  context 'protected methods' do
    it 'returns protected singleton methods' do
      metadata = DefinedMethods::Singleton.protected_methods_defined_in(Raiser)

      expect(metadata[:object_name]).to eq('Raiser')
      expect(metadata[:methods]).to eq(%i[do_raise])
      expect(metadata[:private]).to be(false)
      expect(metadata[:protected]).to be(true)
      expect(metadata[:singleton]).to be(true)
    end
  end
end
