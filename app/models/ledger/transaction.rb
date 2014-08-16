module Ledger
  class Transaction < ActiveRecord::Base
    include ActiveModel::Validations
    belongs_to :in, class: Entry
    belongs_to :out, class: Entry

    validates :in, :out, presence: true, uniqueness: true
    validates_with TransactionBalance
    validates_with TransactionTwoAccount
  end
end
