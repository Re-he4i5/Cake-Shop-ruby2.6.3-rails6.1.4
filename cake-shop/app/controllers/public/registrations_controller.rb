# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def after_sign_up_path_for(resource)
    mypage_path
  end

  def after_update_path_for(resource)
    mypage_path
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number])
  end

end
