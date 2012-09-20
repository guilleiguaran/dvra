class PostsController < ApplicationController
  before_filter :authenticate_user

  # GET /posts.json
  # GET /posts.xml
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.xml  { render xml: @posts }
    end
  end

  # GET /posts/1.json
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.json { render json: @post }
      format.xml  { render xml: @posts }
    end
  end

  # POST /posts.json
  # POST /posts.xml
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.json { render json: @post, status: :created, location: @post }
        format.xml  { render xml: @post, status: :created, location: @post }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.xml  { render xml: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1.json
  # PATCH/PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(post_params)
        format.json { head :no_content }
        format.xml  { head :no_content }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.xml  { render xml: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1.json
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.json { head :no_content }
      format.xml  { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def post_params
      params.require(:post).permit(:content, :title)
    end
end
