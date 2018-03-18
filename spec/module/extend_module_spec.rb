require 'spec_helper'
require_relative '../fixtures/module'

class Bar
  extend RaiserUtil
end

RSpec.describe DefinedMethods do
  describe 'extend module' do
    context 'singleton methods' do
      it 'does not return extended public singleton methods' do
        metadata = DefinedMethods::Singleton.methods_defined_in(Bar)

        expect(metadata[:object_name]).to eq('Bar')
        expect(metadata[:methods]).to eq([])
        expect(metadata[:private]).to be(false)
        expect(metadata[:protected]).to be(false)
        expect(metadata[:singleton]).to be(true)
      end
    end

    context 'private methods' do
      it 'does not return extended private singleton methods' do
        metadata = DefinedMethods::Singleton.private_methods_defined_in(Bar)

        expect(metadata[:object_name]).to eq('Bar')
        expect(metadata[:methods]).to eq([])
        expect(metadata[:private]).to be(true)
        expect(metadata[:protected]).to be(false)
        expect(metadata[:singleton]).to be(true)
      end
    end

    context 'protected methods' do
      it 'does not return extended protected singleton methods' do
        metadata = DefinedMethods::Singleton.protected_methods_defined_in(Bar)

        expect(metadata[:object_name]).to eq('Bar')
        expect(metadata[:methods]).to eq([])
        expect(metadata[:private]).to be(false)
        expect(metadata[:protected]).to be(true)
        expect(metadata[:singleton]).to be(true)
      end
    end
  end
end
