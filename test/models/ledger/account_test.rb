require 'test_helper'

module Ledger
  class AccountTest < ActiveSupport::TestCase
    fixtures 'ledger/accounts', 'ledger/entries'
    fixtures 'quantity/types', 'quantity/units', 'quantity/values'
    test 'presence of name' do
      account = Account.new(name: nil)
      assert account.invalid?
      assert account.errors.has_key? :name
    end

    test 'uniqueness name' do
      account = Account.new(name: ledger_accounts(:principal).name)
      assert account.invalid?
      assert account.errors.has_key? :name
    end

    test 'valid' do
      parent = ledger_accounts(:principal)
      unit = quantity_units(:real)
      account = Account.new(name: 'Financeiro', account: parent, unit: unit)
      assert account.valid?
    end

    test 'accounts' do
      account = ledger_accounts(:principal)
      assert_equal 1, account.accounts.length
    end

    test 'balance' do
      account = ledger_accounts(:estoque)
      assert_equal 0, account.balance
    end
  end
end
