class Store < ActiveRecord::Base
  has_many :transactions

  validates_uniqueness_of :cpf
end