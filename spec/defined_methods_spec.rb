require 'spec_helper'
require_relative 'fixtures/arithmeter'

RSpec.describe DefinedMethods do
  describe 'module methods' do
    describe '.in' do
      it 'returns defined methods' do
        metadata = DefinedMethods::in(Arithmeter)
        expect(metadata).to_not be_nil
      end
    end
    describe '.fqmn' do
      it 'returns name for singleton method' do
        group = { singleton: true, object_name: 'Arithmeter'}
        method_name = 'add'
        fqmn = DefinedMethods::fqmn(group[:object_name], method_name, group[:singleton])
        expect(fqmn).to eq('Arithmeter.add')
      end

      it 'returns name for not singleton method' do
        group = { singleton: false, object_name: 'Arithmeter'}
        method_name = 'add'
        fqmn = DefinedMethods::fqmn(group[:object_name], method_name, group[:singleton])
        expect(fqmn).to eq('Arithmeter#add')
      end
    end
  end
end