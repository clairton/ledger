require 'test_helper'

module Ledger
  class TransactionTwoAccountTest < ActiveSupport::TestCase
    fixtures 'ledger/accounts', 'ledger/entries', 'ledger/transactions'
    fixtures 'quantity/types', 'quantity/units', 'quantity/values'

    test 'invalid' do
      entry = Entry.create(account: ledger_accounts(:estoque), value: quantity_values(:entrada_venda2))
      out = Entry.create(account: ledger_accounts(:estoque), value: quantity_values(:entrada_venda2))
      transaction = Transaction.new(in: entry, out: out)
      assert transaction.invalid?
      assert transaction.errors.has_key? :in
      assert transaction.errors.has_key? :out
    end
  end
end
