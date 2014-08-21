module Ledger
  class Entry < ActiveRecord::Base
    belongs_to :account
    belongs_to :value, class_name: 'Quantity::Value'

    validates :value, :account, presence: true
    validates :value, uniqueness: true
    validates_with EntryCannotZeroValue
    validates_with EntrySameUnit

    def to_s
      "#{try :account}: #{try :value}"
    end
  end
end
