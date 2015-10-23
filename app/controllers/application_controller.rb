class ApplicationController < ActionController::Base
 # Prevent CSRF attacks by raising an exception.
 # For APIs, you may want to use :null_session instead.
 protect_from_forgery with: :exception

 rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_url, alert: exception.message
 end

 #### must add if using cancan otherwise no data will get inserted/updated
 before_filter do
  resource = controller_name.singularize.to_sym
  method = "#{resource}_params"
  params[resource] &&= send(method) if respond_to?(method, true)
 end
 #### end of cancan workaround

end
