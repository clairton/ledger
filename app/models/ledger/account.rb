module Ledger
  class Account < ActiveRecord::Base
    belongs_to :account
    has_many :accounts
    has_many :entries
    belongs_to :unit, class: Quantity::Unit

    validates :name, :balance, :account, :unit, presence: true
    validates :name, uniqueness: true
  end
end
