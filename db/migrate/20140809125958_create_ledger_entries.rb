class CreateLedgerEntries < ActiveRecord::Migration
  def change
    create_table :ledger_entries do |t|
      t.integer :account_id, null: false, length: 10
      t.integer :value_id, null: false, length: 10

      t.timestamps
    end
  end
end
