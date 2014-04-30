ActiveAdmin.register User do

  index do 
    column :email
    column :sign_in_count
    column :current_sign_in_at
    column :last_sign_in_at
    column :created_at
    column :updated_at
    default_actions
  end
  
end
