ActiveAdmin.register Book do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #


  # permit_params :title, :price, :books_in_stock, :description, :author_id, :category_id, :image



  index do
    column :title
    column :price
    column :books_in_stock
    column :author_id
    column :category_id
    column :image
    column :description
 end



 #  index do
 #    column :one
 #    column :two
 #    column :three
 #    column :name
 #    column :title
 #    column :pages
 #    column :description do 
 #      raw "<a class='view_description button'>View Description</a>"
 #    end
 # end


  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :price, :books_in_stock, :author_id, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
