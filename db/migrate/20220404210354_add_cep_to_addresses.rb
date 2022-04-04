class AddCepToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :cep, :string
  end
end
