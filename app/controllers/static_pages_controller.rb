class StaticPagesController < ApplicationController
  def intro
    @microposts = Micropost.order("created_at DESC").first(20)
  end
end
