class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
     flash.now[:error] = '邮箱或者用户名不正确，请在输入一次'
      render 'new'
    end
  end

  def destory
    sign_out
    redirect_to root_path
  end
end
