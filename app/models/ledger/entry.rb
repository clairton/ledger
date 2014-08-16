module Ledger
  class Entry < ActiveRecord::Base
    include ActiveModel::Validations
    belongs_to :account
    belongs_to :value, class: Quantity::Value

    validates :value, :account, presence: true
    validates :value, uniqueness: true
    validates_with EntryCannotZeroValue
    validates_with EntrySameUnit
  end
end
