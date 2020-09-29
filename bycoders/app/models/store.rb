class Store < ActiveRecord::Base
  has_many :transactions

  def self.find_or_create(params)
    store = Store.find_or_create_by(params)
  end
end