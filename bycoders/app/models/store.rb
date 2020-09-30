class Store < ActiveRecord::Base
  has_many :transactions

  validates_presence_of :name, :owner_name, :balance
end