class CustomersController < ApplicationController

# 	def index
#     @customers = Customer.find(params[:id])
#   end

#   def new
#      @customers = Customer.new
#     #hij creert een nieuwe subject
#   end

#   def create
#      #Instantiate a new object using form paramters
#     @customer = Customer.new(customer_params)
#     #Save the object
#     if @customer.save
#     #If save succeeds, redirect to the inex acton
#     flash[:notice] = "Subject created successfully"
#     redirect_to(:action => 'index')
#     else
#     #If save fails, redisplay the form so user can fix problems
#     render('new') #het zit in de new.html template
#     end
#   end


#   def show
#     @customers = Customer.find(params[:id])

#   end

#   def edit
#     @customer = Customer.find(params[:id])
#   end

  # def delete
  #    @customer = Customer.find(params[:id])
  #    redirect_to root_path
  # end

#   def destroy
#     customer = Customer.find(params[:id]).destroy #deze is zonder @ omdat het geen template rendert
#     flash[:notice] = "Subject '#{customer.first_name}' destroyed successfully"
#     redirect_to(:action => 'index')
#   end

#   private
#   def customer_params
#     params.require(:customer).permit(:first_name, :last_name)
#   end
# end

end
