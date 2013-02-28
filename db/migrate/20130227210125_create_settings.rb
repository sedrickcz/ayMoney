class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name
      t.text :value, default: nil
      t.string :input_type, default: 'text'
      t.text :input_options, default: ''

      t.timestamps
    end
  end
end
