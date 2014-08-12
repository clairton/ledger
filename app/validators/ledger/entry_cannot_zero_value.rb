module Ledger
  class EntryCannotZeroValue < ActiveModel::Validator
    def validate(entry)
      if !entry.value.nil? && entry.value.amount == 0
        entry.errors[:amount] << 'amount of value doesn\'t can be zero'
        entry.value.errors[:amount] << 'value doesn\'t can be zero'
      end
    end
  end
end
