class CreateLedgerAccounts < ActiveRecord::Migration
  def change
    create_table :ledger_accounts do |t|
      t.string :name, null: false, length: 200
      t.integer :account_id, null: false, length: 10

      t.timestamps
    end
  end
end
