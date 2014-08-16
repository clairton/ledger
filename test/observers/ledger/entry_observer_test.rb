require 'test_helper'

module Ledger
  class EntryObserverTest < ActiveSupport::TestCase
    fixtures 'ledger/accounts', 'ledger/entries', 'quantity/ratios'
    fixtures 'quantity/types', 'quantity/units', 'quantity/values'

    test 'increase account balance' do
      account = ledger_accounts(:estoque)
      value = Quantity::Value.create(unit: quantity_units(:un), amount: 3)
      expected = ledger_accounts(:estoque).balance + 3
      entry = Entry.create(account: account, value: value)
      assert expected, entry.account.balance
    end

    test 'decrement account balance' do
      account = ledger_accounts(:estoque)
      value = quantity_values(:saida_estoque2)
      expected = ledger_accounts(:estoque).balance - 1
      entry = Entry.create(account: account, value: value)
      assert expected, entry.account.balance
    end

    test 'simple' do
      observer = EntryObserver.instance
      account = ledger_accounts(:estoque)
      value = quantity_values(:saida_estoque2)
      expected = ledger_accounts(:estoque).balance - 1
      entry = Entry.create(account: account, value: value)
      observer.before_save(entry)
      assert expected, entry.account.balance
    end
  end
end
