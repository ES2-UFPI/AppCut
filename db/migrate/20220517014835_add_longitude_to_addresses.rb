class AddLongitudeToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :longitude, :float
  end
end
