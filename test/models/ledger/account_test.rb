require 'test_helper'

module Ledger
  class AccountTest < ActiveSupport::TestCase
    fixtures 'ledger/accounts'
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
      account = Account.new(name: 'Financeiro', account: ledger_accounts(:principal))
      assert account.valid?
    end

    test 'accounts' do
      account = ledger_accounts(:principal)
      assert_equal 1, account.accounts.length
    end

    # test 'balance' do
    #   account = ledger_accounts(:estoque)
    #   assert_equal 1, account.balance
    # end
  end
end
