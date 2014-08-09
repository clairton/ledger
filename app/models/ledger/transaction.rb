module Ledger
  class Transaction < ActiveRecord::Base
    belongs_to :in, class: Entry
    belongs_to :out, class: Entry

    validates :in, :out, presence: true, uniqueness: true
  end
end
