require 'spec_helper'

describe Transaction do
  describe '#validations' do
    it 'presence of date_and_time' do
      record = Transaction.new
      record.date_and_time = nil
      record.valid?
      expect(record.errors[:date_and_time]).to include("can't be blank")

      record.date_and_time = '2019-03-01 10:00:00'
      record.valid?
      expect(record.errors[:date_and_time]).to_not include("can't be blank")
    end

    it 'presence of value' do
      record = Transaction.new
      record.value = nil
      record.valid?
      expect(record.errors[:value]).to include("can't be blank")

      record.value = 140.32
      record.valid?
      expect(record.errors[:value]).to_not include("can't be blank")
    end

    it 'presence of card' do
      record = Transaction.new
      record.card = nil
      record.valid?
      expect(record.errors[:card]).to include("can't be blank")

      record.card = '1234****6678'
      record.valid?
      expect(record.errors[:card]).to_not include("can't be blank")
    end

    it 'presence of cpf' do
      record = Transaction.new
      record.cpf = nil
      record.valid?
      expect(record.errors[:cpf]).to include("can't be blank")

      record.cpf = '556.418.150-63'
      record.valid?
      expect(record.errors[:cpf]).to_not include("can't be blank")
    end
  end
end
