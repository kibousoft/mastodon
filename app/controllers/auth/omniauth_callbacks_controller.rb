# frozen_string_literal: true

class Auth::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.errors.any?
      reason = @user.errors.full_messages.join(' / ')
      set_flash_message(:alert, :failure, kind: "Facebook", reason: reason)
      redirect_to new_user_session_path and return
    end

    if @user.present?
      p "Login Success"
      sign_in @user
      redirect_to root_path
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to root_path
    end
  end

  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.present?
      sign_in @user
      set_flash_message(:notice, :success, :kind => "GitHub") if is_navigational_format?
      redirect_to root_path and return
    end

    failure_reason = if @user.errors.any? @user.errors.full_messages.join(' / '); else nil end
    set_flash_message(:notice, :failure, kind: "GitHub", reason: failure_reason)
    redirect_to new_user_session_path
  end

  def failure
    redirect_to root_path
  end
end
