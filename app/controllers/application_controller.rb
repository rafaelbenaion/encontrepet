class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

before_filter :initialize_metas

def initialize_metas
    @meta = { title: 'Encontrepet.com - Adote uma vida !', description: 'Quer adotar um novo amigo? Ou então ajudar um animal abandonado encontrar uma nova família? Encontrepet.com ajuda você! Uma simples rede social de adoção de animais.', image: 'http://encontrepet.com/encontrepet3.png', type: 'website' }
end

before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :profile_name
    devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :profile_name
    
  end


  protect_from_forgery with: :exception
end

