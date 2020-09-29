class Transaction < ActiveRecord::Base
  belongs_to :store
  belongs_to :transaction_type
end