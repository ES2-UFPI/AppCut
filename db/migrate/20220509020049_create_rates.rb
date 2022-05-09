class CreateRates < ActiveRecord::Migration[6.1]
  def change
    create_table :rates do |t|
      t.references :user, null: false, foreign_key: true
      t.references :professional_profile, null: false, foreign_key: true
      t.integer :rate, null: false
      t.string :comment
      t.timestamps
    end
  end
end
