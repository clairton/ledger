module Ledger
  class Account < ActiveRecord::Base
    belongs_to :account
    has_many :accounts
    has_many :entries
    validates :name, :account, presence: true
    validates :name, uniqueness: true

    def balance
      
    end
  end
end
