class BooksController < ApplicationController
  before_action :set_book, only: :show

  # GET /books
  # GET /books.json
  def index
    # @books = Book.all
    # @books = @books.where(title: params[:q][:name]) if jjjj
    # @books = @books.where("title LIKE ?", "%#{q}%") 
    # @books = @books.where(arel_table[:title].matches("%#{search}%"))

    @books = Book.all
    @search = params["search"]

    if @search.present?
      @name = @search["title"]
      @books = @books.where("title LIKE ?", "%#{@name}%")
    end
    
    # @books = @books.where("title LIKE ?", "%#{@name}%").joins(:authors).where("title LIKE ?", "%#{@name}%"))


    # if @search.present?
    #   @name = @search["title"]
    #   @books = book.author.where(:lastname => @name).joins(:books).where("book.title = ?", @name)
    # end

    # @books = @books.where(:title => @name).joins(:authors).where("authors.lastname = ?", @name)

  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

end