module Ledger
  class Transaction < ActiveRecord::Base
    belongs_to :in, class_name: 'Entry'
    belongs_to :out, class_name: 'Entry'

    validates :in, :out, presence: true, uniqueness: true
    validates_with TransactionBalance
    validates_with TransactionTwoAccount

    def to_s
      "#{try :out} -> #{try :in}"
    end
  end
end
