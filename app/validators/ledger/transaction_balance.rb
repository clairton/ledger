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
        ratio = Quantity::Ratio.for(inn.unit, out.unit)
        if ratio.nil?
          aux = inn.unit
          inn.unit = out.unit
          out.unit = aux
          ratio = Quantity::Ratio.for(out.unit, inn.unit)
          if ratio.nil?
            message(transaction, 'incompatible units, doesn\'t there\'s ratio between theirs')
            return
          end
          balance = inn.amount + ration.to(out.amount)
        end
        unless balance == 0
          message(transaction, 'sum of in and out must be zero')
        end
      end
    end

  private
    def message(transaction, message)
      [:in, :out].each {|attr|
        transaction.errors[attr] << message
      }
    end
  end
end
