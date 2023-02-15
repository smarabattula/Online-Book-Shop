class AddUsercolumnsToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :credit_card_number, :string
    add_column :transactions, :address, :string
    add_column :transactions, :phone_number, :string
  end
end
