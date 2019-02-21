class PostsController < ApplicationController
  #before_action :authenticate_user! 
  before_action :set_post, only: [ :show, :edit, :update, :destroy]
  before_action :find_campaign


  def index
    @posts = Post.all
    @posts_by_date = @posts.group_by { |post| post.post_date.to_date }
  end

  def show
    
  end

  def new
    
    @post = Post.new
  end

  def edit
    
  end

  
  def create
    
    @post = Post.new(post_params)
    @post.post_on_facebook = params[:post][:post_on_facebook] == "1"
    @post.campaign= @campaign
    @post.user = current_user

    #byebug
    respond_to do |format|
      if @post.save
        format.html { redirect_to campaign_path(@campaign.id), notice: 'Post was successfully created.' }
        # format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to campaign_path(@campaign.id), notice: 'Post error: {#@post.errors}' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
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

    def user
      current_user
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def find_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end

    
    def post_params
      params.require(:post).permit(:title, :body, :post_date, :user_id, :post_on_facebook)
    end
end
