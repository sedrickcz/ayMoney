class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :title
      t.text :description
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
