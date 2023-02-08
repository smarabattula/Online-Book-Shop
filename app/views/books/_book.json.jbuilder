json.extract! book, :id, :Name, :Author, :Publisher, :Price, :Stock, :created_at, :updated_at
json.url book_url(book, format: :json)
