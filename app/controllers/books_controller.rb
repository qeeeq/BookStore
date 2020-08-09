class BooksController < ApplicationController
  before_action :set_book, only: :show

  # GET /books
  # GET /books.json
  def index
    @books = Book.all

    # @books = @books.where(title: params[:q]) if params[:q].present?
    # @books = @books.where("title LIKE ?", "#{params[:q]}") if params[:q].present?


    if params[:q].present?
      @books = Book.where("title LIKE ?", "%#{params[:q]}%")
    else
      @books = Book.paginate(page: params[:page])
    end

    if params[:q].present?
      # @books = Book.joins(:authors).where("title LIKE ? or name LIKE = ?" , "%#{params[:q]}%", "%#{params[:q]}%")
      # @books = Book.where("title LIKE ?", "%#{:q}%").joins(:authors).where("name LIKE = ?", "%#{params[:q]}%")
      # @books = Author.where("name LIKE = ?", "%#{params[:q]}%").joins(:books).where("title LIKE = ?", "%#{params[:q]}%")
      # @books = Book.joins(:authors).where("title LIKE ?", "%#{params[:q]}%")

    else
      @books = Book.all
    end



    # @books = Book.all
    # @search = params["search"]

    # if @search.present?
    #   @name = @search["title"]
    # @books = @books.where("title LIKE ?", "%#{:q}%") if true
    # end



    # Author.where("firstname LIKE ?", "%#{"a"}%").joins(:books).where("title LIKE ?", "%#{@name}%")

    # this return
    # @books = @books.where("title LIKE ?", "%#{@name}%")
    
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