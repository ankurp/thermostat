module StaticHelper

  def resource_name
    :admin_user
  end

  def resource
    @resource ||= AdminUser.new
  end

  def resource_class 
    AdminUser
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:admin_user]
  end

end
