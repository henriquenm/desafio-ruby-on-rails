class TransactionType < ActiveRecord::Base
  has_many :transactions

  def self.find_by_code(code)
    find_by(type_code: code)
  end
end