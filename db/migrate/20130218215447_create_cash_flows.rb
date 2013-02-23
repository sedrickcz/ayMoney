class CreateCashFlows < ActiveRecord::Migration
  def self.up
    create_table :cash_flows do |t|
      t.date :date
      t.decimal :amount, precision: 16, scale: 2
      t.text :description
      t.integer :category_id, null: false, references: [:categories, :id]
      t.integer :account_id, null: false, references: [:accounts, :id]
      t.boolean :deleted, default: false

      t.timestamps
    end
    add_index :cash_flows, :category_id
    add_index :cash_flows, :account_id
  end

  def self.down
    drop_table :cash_flows
  end
end
