ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :total_price, :completed_date, :customer_id, :credit_card_id, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:total_price, :completed_date, :customer_id, :credit_card_id, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :id
    column :total_price
    column :completed_date
    column :created_at
    column :customer
    column :credit_card
    tag_column :status, interactive: true
    actions
  end
  
end
