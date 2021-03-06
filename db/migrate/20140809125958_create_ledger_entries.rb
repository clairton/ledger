class CreateLedgerEntries < ActiveRecord::Migration
  def change
    create_table :ledger_entries do |t|
      t.integer :account_id, null: false
      t.integer :value_id, null: false, unique: true

      t.timestamps
    end
  end
end
