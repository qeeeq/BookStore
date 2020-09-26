ActiveAdmin.register Book do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #


  permit_params :title, :price, :books_in_stock, :description, :author_id, :category_id, :image



  # form do |f|
  #   input :author
  #   input :category
  #   input :image, as: :file
  #   input :title
  #   input :price
  #   input :books_in_stock
  #   input :description
  #   actions
  # end

  index do
    column :title
    column :price
    column :books_in_stock
    column :author
    column :category
    column :image do |book|
      image_tag url_for(book.image), width: 150 if book.image.attached?
    end
    column :description
    column :average_ratings do |book|
      book.average_rating
    end
    actions
  end

  # show do
  #   attributes_table do
  #     row :title
  #     row :price
  #     row :books_in_stock
  #     row :author
  #     row :category
  #     row :image do |book|
  #       image_tag url_for(book.image), width: 250
  #     end
  #   end
  # end
    

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
