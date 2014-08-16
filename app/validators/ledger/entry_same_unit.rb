module Ledger
  class EntrySameUnit < ActiveModel::Validator
    def validate(entry)
      if !entry.value.nil? and !entry.account.nil?
        destiny = entry.account.unit
        origin = entry.value.unit
        if origin != destiny
          begin
            ratio = Quantity::Ratio.for(origin, destiny)
            amount = ratio.to(entry.value.amount)
          rescue ActiveRecord::RecordNotFound => e
            entry.errors.add(:account, e.message)
            entry.account.errors.add(:unit, e.message)
            entry.errors.add(:value, e.message)
            entry.value.errors.add(:unit, e.message)
          end
        end
      end
    end
  end
end
