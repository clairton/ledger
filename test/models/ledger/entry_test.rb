require 'test_helper'

module Ledger
  class EntryTest < ActiveSupport::TestCase
    fixtures 'ledger/accounts', 'ledger/entries'
    fixtures 'quantity/types', 'quantity/units', 'quantity/values'

    test 'presence of value' do
      entry = Entry.new(account: ledger_accounts(:estoque), value: nil)
      assert entry.invalid?
      assert entry.errors.has_key? :value
    end

    test 'uniqueness of value' do
      entry = Entry.new(account: ledger_accounts(:estoque), value: quantity_values(:saida_estoque))
      assert entry.invalid?
      assert entry.errors.has_key? :value
    end

    test 'presence of account' do
      entry = Entry.new(account: nil, value: quantity_values(:saida_estoque2))
      assert entry.invalid?
      assert entry.errors.has_key? :account
    end

    test 'valid' do
      entry = Entry.new(account: ledger_accounts(:estoque), value: quantity_values(:saida_estoque3))
      assert entry.valid?
    end
  end
end
