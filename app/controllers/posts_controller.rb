class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order('id DESC')
  end


  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @board = Board.find(params[:board_id])
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @board = Board.find(params[:board_id])
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @board = Board.find(params[:board_id])
    @post = @board.posts.create(post_params)
    @post.user = current_user
    @post.board = @board
    respond_to do |format|
      if @post.save
        format.html { redirect_to @board, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
    # redirect_to board_posts_path
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to board_posts_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to board_posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params

      params.require(:post).permit(:title, :content, :post_type)
    end
end
