class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :Name
      t.string :Author
      t.string :Publisher
      t.decimal :Price
      t.integer :Stock

      t.timestamps
    end
  end
end
