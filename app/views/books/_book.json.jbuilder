json.extract! book, :id, :title, :price, :books_in_stock, :created_at, :updated_at
json.url book_url(book, format: :json)
