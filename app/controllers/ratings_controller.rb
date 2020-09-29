class RatingsController < ApplicationController
	def create
    @rating = Rating.create(rating_params.merge(customer_id: current_customer.id))
    # byebug
    if @rating.persisted?
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }                     
    end
     end 

	end

	def update
    @rating = Rating.find(params[:id])
    if @rating.update(rating_params.merge(customer_id: current_customer.id))
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }                     
      end
    else
      respond_to do |format|
        format.html { redirect_to book_path }
      end
    end
	end

	private
  
  def rating_params
    params.require(:rating).permit(:rating_number, :book_id)
  end
end