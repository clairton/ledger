require 'test_helper'

module Ledger
  class EntryCannotZeroValueTest < ActiveSupport::TestCase
    fixtures 'ledger/accounts', 'ledger/entries'
    fixtures 'quantity/types', 'quantity/units', 'quantity/values'

    test 'zero amount in value' do
      value = quantity_values(:saida_estoque3)
      value.amount= 0.0
      entry = Entry.new(account: ledger_accounts(:estoque), value: value)
      assert entry.invalid?
      assert entry.errors.has_key? :amount
      assert entry.value.errors.has_key? :amount
    end
  end
end
