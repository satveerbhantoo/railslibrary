ActiveAdmin.register Book do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


permit_params :name, :synopsis, :publisher, :published_date, :img_url, :is_borrowed, :date_borrowed, :user_id, :library_id, :category_ids => []



before_action :upload_to_cloudinary, only: [:create, :update]

controller do 
    def upload_to_cloudinary
        if params[:book][:cover] != nil
            cloudinary_resp = Cloudinary::Uploader.upload(params[:book][:cover])
            params[:book][:img_url] = cloudinary_resp["secure_url"]
        end
        params[:book][:is_borrowed] = false
        
    end
end

    form do |f|
        f.inputs do
            f.input :name
            f.input :synopsis
            f.input :publisher
            f.input :published_date
            f.input :library
            f.input :cover, as: :file
            f.input :category_ids, :as => :check_boxes, :collection => Category.all
        end

        f.actions
    end
end
