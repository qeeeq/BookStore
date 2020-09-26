class BooksController < ApplicationController
  before_action :set_book, only: [:update, :show]
  before_action :set_customer, only: [:show]

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
  end

  def update
    # byebug
    if @book.update!(book_params)
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
    # @book.build_ratings unless @book.ratings
    # 
    # @book.ratings.build(customer_id: @customer.id)
    
    if @book.ratings.blank?
      @book.ratings.build(customer_id: current_customer.id)
      @book.ratings
    end
    # byebug
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end

  def set_customer
    @customer = current_customer
  end

  def book_params
    params.require(:book).permit(ratings_attributes: [:id, :rating_number])
  end

end