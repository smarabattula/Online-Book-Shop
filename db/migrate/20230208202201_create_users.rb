class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :email
      t.string :address
      t.string :credit_card_number
      t.string :phone_number
      t.boolean :is_admin

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
