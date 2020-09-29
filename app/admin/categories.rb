ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title


  index do
    column :Category do |category|
      category.title
    end
    column :Books do |a|
      a.books do |b|
        b.title
      end
    end
    column :created_at
    column :updated_at
    actions
  end

  #
  # or
  #
  # permit_params do
  #   permitted = [:title]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
