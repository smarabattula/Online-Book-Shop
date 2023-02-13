class AddTxnNumberToTransaction < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :transaction_number, :string
  end
end
