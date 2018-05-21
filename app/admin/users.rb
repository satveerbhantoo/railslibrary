ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :is_admin, :is_active
  
  controller do
    def update_resource(object, attributes)
      update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
      object.send(update_method, *attributes)
    end
  end
  
  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :is_admin
    column :is_active
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password , only: [:create]
      f.input :password_confirmation, only: [:create]
      f.input :is_admin
      f.input :is_active
    end
    f.actions
  end

end
