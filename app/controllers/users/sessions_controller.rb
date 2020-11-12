# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
      user.introduction = "新規投稿・閲覧、コメント・日記投稿ができます。定期的にデータを削除しておりますので、あらかじめご了承ください。メールアドレスなどの編集や退会はできません。"
      user.image = open("./app/assets/images/gest-icon.png")
    end
    if  user_signed_in?
        redirect_to user_path(user), alert: "ログインしています"
    else
        sign_in user
        redirect_to user_path(user), notice: 'ゲストユーザーとしてログインしました。'
    end
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
