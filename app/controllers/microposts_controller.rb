# encoding: utf-8
class MicropostsController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  # GET /microposts
  # GET /microposts.json
  def index
    @microposts = Micropost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @microposts }
    end
  end

  # GET /microposts/1
  # GET /microposts/1.json
  def show
    @micropost = Micropost.find(params[:id])
    if !@micropost.video_url.empty?
      @video_id=@micropost.video_url.split("id_")[1]
      ampersandPosition = @video_id.index("?f=")
      if ampersandPosition
        @video_id = @video_id[0..ampersandPosition-1]
      end
      @video_id= @video_id.delete(".html")
    end


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @micropost }
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
    if   @micropost.video_url or  @micropost.article_url

      if !@micropost.video_url.empty?
        url = @micropost.video_url
      elsif !@micropost.article_url.empty?
        url = @micropost.article_url
      end
      doc = Nokogiri::HTML(open(url))
      @micropost.title = doc.css("title").text.delete("—在线播放—优酷网，视频高清在线观看")

      if !@micropost.video_url.empty?
        video_thumbnail_url =  doc.css("a#s_qq_haoyou")[0]['href']
        video_thumbnail_url =  video_thumbnail_url.split("pics=")[1]
        @micropost.video_thumbnail_url = video_thumbnail_url.split("&site=")[0]
      end
    end

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
    @micropost=Micropost.offset(rand(Micropost.count)).first
    @microposts = Micropost.all.shuffle.first(4)
  end


  def admin_panel
    @microposts = Micropost.all
    render :layout => false
  end

  def index2
    @micropost=Micropost.offset(rand(Micropost.count)).first
    @microposts = Micropost.all.shuffle.first(3)
    render :layout => false
  end
end
