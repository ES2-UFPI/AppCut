class CreateAgendas < ActiveRecord::Migration[6.1]
  def change
    create_table :agendas do |t|
      t.datetime :start_time
      t.references :professional_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
