module Ledger
  class EntryObserver < ActiveRecord::Observer
    def before_save(entry)
      destiny = entry.account.unit
      origin = entry.value.unit
      amount = entry.value.amount
      if origin != destiny
        ratio = Quantity::Ratio.for(origin, destiny)
        amount = ratio.to(entry.value.amount)
      end
      entry.account.balance += amount
    end
  end
end
