class PostsController < ApplicationController
  #before_action :authenticate_user! 
  before_action :set_post, only: [ :show, :edit, :update, :destroy]
  before_action :find_campaign


  # def index
  #   @posts = Post.all
  # end

  def show
    
  end

  def new
    
    @post = Post.new
  end

  def edit
    
  end

  
  def create
    
    @post = Post.new(post_params)
    @post.campaign= @campaign
    respond_to do |format|
      if @post.save
        format.html { redirect_to campaign_path(@campaign.id), notice: 'Post was successfully created.' }
        # format.json { render :show, status: :created, location: @post }
      else
        format.html { render "campaign/show" }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to campaign_post_path(@campaign,@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to campaign_path(@campaign), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_post
      @post = Post.find(params[:id])
    end

    def find_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end

    
    def post_params
      params.require(:post).permit(:title, :body, :post_date)
    end
end
