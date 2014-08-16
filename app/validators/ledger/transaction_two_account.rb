module Ledger
  class TransactionTwoAccount < ActiveModel::Validator
    def validate(transaction)
      if transaction.in.nil? || transaction.out.nil?
        return
      end
      inn = transaction.in
      out = transaction.out
      if inn.account == out.account
        [:in, :out].each do |attr|
          transaction.errors[attr] << 'Account\'s of transaction must be differences'
        end
      end
    end
  end
end
