class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false, default: ""
      t.string :name, null: false
      t.string :email, null: false, default: ""
      t.string :address
      t.string :credit_card_number
      t.string :phone_number
      t.boolean :is_admin, default: 0

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
