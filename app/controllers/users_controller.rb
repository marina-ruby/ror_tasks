class UsersController < ApplicationController
  http_basic_authenticate_with email: "orange",
                               password: "secret"
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end

end