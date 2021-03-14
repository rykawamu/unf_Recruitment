class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      # ユーザログイン後に写真一覧のページにリダイレクトする
      log_in user
      redirect_to photolist_path, notice: "ログインしました"
    else
      name = params[:session][:name]
      passwd = params[:session][:password]
      # ユーザーIDの入力チェック
      if name.blank?
        flash.now[:message1] = 'ユーザIDを入力してください'
      end
      # パスワードの入力チェック
      if passwd.blank?
        flash.now[:message2] = 'パスワードを入力してください'
      end
      # 該当ユーザが存在しない
      if name && passwd && flash.empty?
        flash.now[:danger] = 'ユーザーIDとパスワードが一致するユーザーが存在しない'
      end

      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :mail, :password, :password_confirmation)
  end
end
