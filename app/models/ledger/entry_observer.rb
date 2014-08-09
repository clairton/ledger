module Ledger
  class EntryObserver < ActiveRecord::Observer
    def before_save(entry)
      destiny = entry.account.unit
      origin = entry.value.unit
      ratio = Quantity::Ratio.find_by(destiny: destiny, origin: origin)
      if ratio.nil?
        entry.errors.add('account', :invalid)
      else
        value = ratio.to(entry.value.amount)
        entry.account.balance += value
      end
    end
  end
end
