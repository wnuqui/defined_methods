require 'spec_helper'
require_relative '../fixtures/module'

class Foo
  include ArithmeterUtil
end

RSpec.describe DefinedMethods do
  describe 'include module' do
    context 'instance methods' do
      it 'does not return included public instance methods' do
        metadata = DefinedMethods::Instance.methods_defined_in(Foo)

        expect(metadata[:object_name]).to eq('Foo')
        expect(metadata[:methods]).to eq([])
        expect(metadata[:private]).to be(false)
        expect(metadata[:protected]).to be(false)
        expect(metadata[:singleton]).to be(false)
      end
    end

    context 'private methods' do
      it 'does not return included private instance methods' do
        metadata = DefinedMethods::Instance.private_methods_defined_in(Foo)

        expect(metadata[:object_name]).to eq('Foo')
        expect(metadata[:methods]).to eq([])
        expect(metadata[:private]).to be(true)
        expect(metadata[:protected]).to be(false)
        expect(metadata[:singleton]).to be(false)
      end
    end

    context 'protected methods' do
      it 'does not return included protected instance methods' do
        metadata = DefinedMethods::Instance.protected_methods_defined_in(Foo)

        expect(metadata[:object_name]).to eq('Foo')
        expect(metadata[:methods]).to eq([])
        expect(metadata[:private]).to be(false)
        expect(metadata[:protected]).to be(true)
        expect(metadata[:singleton]).to be(false)
      end
    end
  end
end
