class Store < ActiveRecord::Base
  has_many :transactions

  validates_uniqueness_of :cpf

  def self.find_or_create(params)
    store = Store.find_or_create_by(params)
  end
end