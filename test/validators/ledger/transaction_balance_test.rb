require 'test_helper'

module Ledger
  class TransactionBalanceTest < ActiveSupport::TestCase
    fixtures 'ledger/accounts', 'ledger/entries', 'ledger/transactions'
    fixtures 'quantity/types', 'quantity/units', 'quantity/values'

    test 'imcompatible units' do
      entry = Entry.new(account: ledger_accounts(:estoque), value: quantity_values(:entrada_estoque2))
      out = Entry.new(account: ledger_accounts(:producao), value: quantity_values(:saida_producao2))
      transaction = Transaction.new(in: entry, out: out)
      assert transaction.invalid?
      assert transaction.errors.has_key? :in
      assert transaction.errors.has_key? :out
      assert transaction.in.errors.has_key? :value
      assert transaction.out.errors.has_key? :value
      assert transaction.in.value.errors.has_key? :amount
      assert transaction.out.value.errors.has_key? :amount
    end

    test 'valid' do
      entry = Entry.create(account: ledger_accounts(:estoque), value: quantity_values(:entrada_venda2))
      out = Entry.create(account: ledger_accounts(:producao), value: quantity_values(:saida_producao3))
      transaction = Transaction.new(in: entry, out: out)
      assert transaction.valid?
    end
  end
end
