require 'spec_helper'
require_relative 'fixtures/arithmeter'

class ArithmeterSubclass < Arithmeter
end

RSpec.describe DefinedMethods do
  describe 'inherited instance methods' do
    context 'instance methods' do
      it 'does not return inherited public instance methods' do
        metadata = DefinedMethods::Instance.methods_defined_in(ArithmeterSubclass)

        expect(metadata[:object_name]).to eq('ArithmeterSubclass')
        expect(metadata[:methods]).to eq([])
        expect(metadata[:private]).to be(false)
        expect(metadata[:protected]).to be(false)
        expect(metadata[:singleton]).to be(false)
      end
    end

    context 'private methods' do
      it 'does not return inherited private instance methods' do
        metadata = DefinedMethods::Instance.private_methods_defined_in(ArithmeterSubclass)

        expect(metadata[:object_name]).to eq('ArithmeterSubclass')
        expect(metadata[:methods]).to eq([])
        expect(metadata[:private]).to be(true)
        expect(metadata[:protected]).to be(false)
        expect(metadata[:singleton]).to be(false)
      end
    end

    context 'protected methods' do
      it 'does not return inherited protected instance methods' do
        metadata = DefinedMethods::Instance.protected_methods_defined_in(ArithmeterSubclass)

        expect(metadata[:object_name]).to eq('ArithmeterSubclass')
        expect(metadata[:methods]).to eq([])
        expect(metadata[:private]).to be(false)
        expect(metadata[:protected]).to be(true)
        expect(metadata[:singleton]).to be(false)
      end
    end
  end

  describe 'inherited singleton methods' do
    context 'singleton methods' do
      it 'does not return inherited public singleton methods' do
        metadata = DefinedMethods::Singleton.methods_defined_in(ArithmeterSubclass)

        expect(metadata[:object_name]).to eq('ArithmeterSubclass')
        expect(metadata[:methods]).to eq([])
        expect(metadata[:private]).to be(false)
        expect(metadata[:protected]).to be(false)
        expect(metadata[:singleton]).to be(true)
      end
    end

    context 'private methods' do
      it 'does not return inherited private singleton methods' do
        metadata = DefinedMethods::Singleton.private_methods_defined_in(ArithmeterSubclass)

        expect(metadata[:object_name]).to eq('ArithmeterSubclass')
        expect(metadata[:methods]).to eq([])
        expect(metadata[:private]).to be(true)
        expect(metadata[:protected]).to be(false)
        expect(metadata[:singleton]).to be(true)
      end
    end

    context 'protected methods' do
      it 'does not return inherited protected singleton methods' do
        metadata = DefinedMethods::Singleton.protected_methods_defined_in(ArithmeterSubclass)

        expect(metadata[:object_name]).to eq('ArithmeterSubclass')
        expect(metadata[:methods]).to eq([])
        expect(metadata[:private]).to be(false)
        expect(metadata[:protected]).to be(true)
        expect(metadata[:singleton]).to be(true)
      end
    end
  end
end
