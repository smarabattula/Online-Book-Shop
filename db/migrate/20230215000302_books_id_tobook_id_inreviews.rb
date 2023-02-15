class BooksIdTobookIdInreviews < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :books_id, :book_id
  end
end
