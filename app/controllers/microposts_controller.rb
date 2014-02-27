# encoding: utf-8
class MicropostsController < ApplicationController
  before_filter :authenticate_user!, only: [:like, :destroy, :edit]
  require 'nokogiri'
  require 'open-uri'
  # GET /microposts
  # GET /microposts.json
  def index
    random = Micropost.all.shuffle.first(8)
    new = Micropost.first(3)
    microposts = new + random
    microposts.uniq!
    @discover_microposts =microposts.first(6)
    @new_micropost = Micropost.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @microposts }
      format.csv { render text: Micropost.to_csv  }
    end
  end

  # GET /microposts/1
  # GET /microposts/1.json
  def show
    @micropost = Micropost.find(params[:id])
    @microposts =  Micropost.all.shuffle.first(3)
    respond_to do |format|
      format.html {render }
      format.json { render json: @micropost }
      format.js
    end
  end

  # GET /microposts/new
  # GET /microposts/new.json
  def new
    @micropost = Micropost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @micropost }
    end
  end

  # GET /microposts/1/edit
  def edit
    @micropost = Micropost.find(params[:id])
  end

  # POST /microposts
  # POST /microposts.json
  def create
    @micropost = Micropost.new(params[:micropost])
    @micropost.user=current_user
    respond_to do |format|
      if @micropost.save
        format.html { redirect_to microposts_url, notice: 'Micropost was successfully created.' }
        format.json { render json: @micropost, status: :created, location: @micropost }
      else
        format.html { render action: "new" }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /microposts/1
  # PUT /microposts/1.json
  def update
    @micropost = Micropost.find(params[:id])

    respond_to do |format|
      if @micropost.update_attributes(params[:micropost])
        format.html { redirect_to @micropost, notice: 'Micropost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy

    respond_to do |format|
      format.html { redirect_to microposts_url }
      format.json { head :no_content }
    end
  end

  def shuffle
    #if  !cookies[:visited]
    #  redirect_to intro_path
    #  cookies[:visited] = { value: true,
    #                        expires: 20.seconds.from_now   }
    #else

    #在sqlite中random,在PG中如何？
      @all_microposts =  Micropost.where(video: true).order('Random()').limit(5)
      #order("RAND()").limit(1)
      @micropost=@all_microposts.first
      @microposts = @all_microposts[1..3]
    #end
    #@new_microposts =  Micropost.order("created_at DESC").first(5)

  end


  def admin_panel
    @microposts = Micropost.all
    render :layout => false
  end

  def index2
    @microposts = Micropost.paginate(:page => params[:page], :per_page => 20).order("created_at DESC")

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.js
    #end
  end

  def shuffle_again
    @microposts = Micropost.where(video: true).shuffle.first(3)
  end

  def like
    if  params[:type] == "like"
      value =1
    elsif params[:type] == "unlike"
      value =0
    end
    #value = params[:type] == "up" ? 1 : -1
    @micropost = Micropost.find(params[:id])
    @micropost.add_or_update_evaluation(:likes, value, current_user)
    respond_to do |format|
      format.html { redirect_to :back, notice: "Thank you for voting!"}
      format.js
    end
  end

end
