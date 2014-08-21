require 'test_helper'

module Ledger
  class TransactionTest < ActiveSupport::TestCase
    fixtures 'ledger/accounts', 'ledger/entries', 'ledger/transactions'
    fixtures 'quantity/types', 'quantity/units', 'quantity/values'

    test 'presence of in' do
      transaction = Transaction.new(in: nil, out: ledger_entries(:saida_estoque2))
      assert transaction.invalid?
      assert transaction.errors.has_key? :in
    end

    test 'uniqueness of in' do
      transaction = Transaction.new(in: ledger_entries(:entrada_estoque), out: ledger_entries(:saida_estoque2))
      assert transaction.invalid?
      assert transaction.errors.has_key? :in
    end

    test 'presence of out' do
      transaction = Transaction.new(out: nil, in: ledger_entries(:saida_estoque2))
      assert transaction.invalid?
      assert transaction.errors.has_key? :out
    end

    test 'uniqueness of out' do
      entry = Entry.create(account: ledger_accounts(:estoque), value: quantity_values(:entrada_venda2))
      transaction = Transaction.new(in: entry, out: ledger_entries(:saida_producao))
      assert transaction.invalid?
      assert transaction.errors.has_key? :out
    end

    test 'to s' do
      transaction = ledger_transactions(:one)
      assert_equal 'Produção: -13.0 un -> Estoque: 13.0 un', transaction.to_s
    end

    test 'valid' do
      transaction = ledger_transactions(:one)
      assert transaction.valid?, transaction.errors.first
    end
  end
end
