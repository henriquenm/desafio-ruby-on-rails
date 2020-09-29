class Transaction < ActiveRecord::Base
  belongs_to :store
  belongs_to :transaction_type

  def self.read_cnab(file)
    File.open(file).each do |line|
      parse_line(line)
    end
  end

  private

    def self.parse_line(line)
      transaction_type_id = find_transaction_type(line.slice(0))
      date_and_time = formatted_datetime(line.slice(1..8), line.slice(42..47))
      value = formatted_value(line.slice(9..18))
      cpf = formatted_cpf(line.slice(19..29))
      card = line.slice(30..41)
      store_owner = line.slice(48..61).strip
      store_name = line.slice(62..80).strip.gsub("\n", "")

      store_params = { name: store_name, owner_name: store_owner, cpf: cpf }
      store = Store.find_or_create(store_params)

      transaction_params = { store_id: store.id, transaction_type_id: transaction_type_id,
        date_and_time: date_and_time, value: value, card: card }
      Transaction.create(transaction_params)
    end

    def self.find_transaction_type(type_code)
      TransactionType.find_by_type_code(type_code).id
    end

    def self.formatted_datetime(date, time)
      DateTime.parse(date+time).strftime("%d/%m/%Y %H:%M:%S")
    end

    def self.formatted_value(value)
      value.to_f/100
    end

    def self.formatted_cpf(cpf)
      "#{cpf[0,3]}.#{cpf[3,3]}.#{cpf[6,3]}-#{cpf[9,2]}"
    end
end