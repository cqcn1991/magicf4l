class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @microposts = @user.microposts
        #Micropost.evaluated_by(:likes, @user)
    #@my_microposts =  current_user.microposts
  end

  def sign_in_too

  end
end
