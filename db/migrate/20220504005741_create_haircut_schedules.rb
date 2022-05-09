class CreateHaircutSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :haircut_schedules do |t|
      t.datetime :reservation_date
      t.references :agenda, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
