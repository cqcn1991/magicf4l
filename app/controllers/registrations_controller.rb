class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    shuffle_microposts_path
  end
end
