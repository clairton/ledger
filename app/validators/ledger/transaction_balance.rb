module Ledger
  class TransactionBalance < ActiveModel::Validator
    def validate(transaction)
      if transaction.in.nil? || transaction.out.nil?
        return
      end
      inn = transaction.in.value
      out = transaction.out.value
      if inn.unit == out.unit
        balance = inn.amount + out.amount
      else
        begin
          ratio = Quantity::Ratio.for(inn.unit, out.unit)
          balance = inn.amount + ratio.to(out.amount)
        rescue ActiveRecord::RecordNotFound => e
          message(transaction, 'incompatible units, doesn\'t there\'s ratio between theirs')
          return
        end
      end
      unless balance == 0
        message(transaction, 'sum of in and out must be zero')
      end
    end

  private
    def message(transaction, message)
      [:in, :out].each do |attr|
        transaction.errors[attr] << message
        transaction.send(attr).errors[:value] << message
        transaction.send(attr).value.errors[:amount] << message
      end
    end
  end
end
