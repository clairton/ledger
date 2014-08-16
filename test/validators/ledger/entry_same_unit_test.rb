require 'test_helper'

module Ledger
  class EntrySameUnitTest < ActiveSupport::TestCase
    fixtures 'ledger/accounts', 'ledger/entries'
    fixtures 'quantity/types', 'quantity/units', 'quantity/values'

    test 'without ratio' do
      account = ledger_accounts(:estoque)
      value = Quantity::Value.create(unit: quantity_units(:real), amount: 10)
      entry = Entry.create(account: account, value: value)
      assert entry.invalid?
      assert entry.errors.has_key? :account
      assert entry.account.errors.has_key? :unit
      assert entry.errors.has_key? :value
      assert entry.value.errors.has_key? :unit
    end
  end
end
