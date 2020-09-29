class BooksController < ApplicationController
  before_action :set_book, only: [:update, :show]
  before_action :set_customer, only: [:show]

  def index
    @books = Book.all

    # @books = @books.where(title: params[:q]) if params[:q].present?
    # @books = @books.where("title LIKE ?", "#{params[:q]}") if params[:q].present?

    if params[:q].present?
      # @books = Book.where("title LIKE ?", "%#{params[:q]}%")
      @books = Book.joins(:author).where("title LIKE ? OR authors.firstname LIKE ?" , "%#{params[:q]}%", "%#{params[:q]}%")
    else
      # @books = Book.paginate(page: params[:page])
    end
  end

  def update
    # byebug
    if @book.update(book_params)
      respond_to do |format|
        format.html { redirect_to :action => "show" }                     
      end
    else
      respond_to do |format|
        format.html { redirect_to :action => "show" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /books/1
  # GET /books/1.json

  def show
    # byebug
    if @customer
      @rating = current_customer.ratings.find_or_initialize_by(book_id: @book.id)
    end
    # @rating ||= Rating.find_or_initialize_by(book_id: @book.id, customer_id: current_customer.id)
    # @book.build_ratings unless @book.ratings
    # 
    # @book.ratings.build(customer_id: @customer.id)

    #if @book.ratings.blank?
    #  @book.ratings.build(customer_id: current_customer.id)
    #end
  end

  private
  
  def set_book
    @book = Book.find(params[:id])
  end

  def set_customer
    @customer = current_customer
  end

  def book_params
    params.require(:book).permit(ratings_attributes: [:rating_id, :rating_number, :customer_id])
  end
end