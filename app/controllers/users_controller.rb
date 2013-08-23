class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @microposts=Micropost.evaluated_by(:likes, @user)
  end

  def sign_in_too

  end
end
