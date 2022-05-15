class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :professional, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
