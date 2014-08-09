module Ledger
  class Entry < ActiveRecord::Base
    belongs_to :account
    belongs_to :value, class: Quantity::Value

    validates :value, :account, presence: true
    validates :value, uniqueness: true
  end
end
