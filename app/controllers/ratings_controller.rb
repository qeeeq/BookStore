class RatingsController < ApplicationController
	before_action :set_book, only: [:update, :create]
  before_action :set_customer, only: [:update, :create]
	# before_action :set_rating, only: [:update, :create]

	def create
    # byebug
    @rating = Rating.find_or_create_by(book_id: @book.id, customer_id: current_customer.id)
	end

	def update
    byebug
		@rating = Rating.find_or_initialize_by(book_id: @book.id, customer_id: current_customer.id)
    if @rating.update(rating_params)
      respond_to do |format|
        format.html { redirect_to book_path }                     
      end
    else
      respond_to do |format|
        format.html { redirect_to book_path }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
	end

	private
	def set_book
    @book = Book.find(params[:id])
  end

  def set_customer
    @customer = current_customer
  end

  # def set_rating
  #   @rating = Rating.current_rating
  # end

  def rating_params
    params.require(:rating).permit(:id, :rating_number, :customer_id, :book_id)
  end

end