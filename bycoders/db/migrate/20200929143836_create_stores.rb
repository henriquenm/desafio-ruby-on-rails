class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.string :owner_name, null: false
      t.string :cpf, null: false, unique: true

      t.timestamps null: false
    end
  end
end
