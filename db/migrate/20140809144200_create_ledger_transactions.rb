class CreateLedgerTransactions < ActiveRecord::Migration
  def change
    create_table :ledger_transactions do |t|
      t.integer :in_id, null: false
      t.integer :out_id, null: false

      t.timestamps
    end
  end
end
