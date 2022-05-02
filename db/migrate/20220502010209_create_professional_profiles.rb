class CreateProfessionalProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :professional_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :description
      t.integer :business_hours
      t.boolean :active
      t.timestamps
    end
  end
end
