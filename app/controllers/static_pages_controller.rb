class StaticPagesController < ApplicationController
  def intro
    @microposts = Micropost.order("created_at DESC").first(20)
  end

  def home
    render :layout => false
  end

  def stats
    @user_count = User.all.count
    @microposts_count = Micropost.all.count
  end
end
