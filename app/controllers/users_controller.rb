class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new

    @user_data = current_user ? User.where(id: current_user.id) : nil;
    @user = User.new

  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create

    data = params[:user]
    @user = User.new(user_params(data))

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    data = params[:user]
    respond_to do |format|
      if @user.update(user_params(data))
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params data
      params = ActionController::Parameters.new({
        user: {
          name: data[:name],
          bio: data[:bio],
          email: data[:email],
          location: data[:location],
          area_of_interest: data[:area_of_interest],
          years_of_expertise: data[:years_of_expertise],
          past_employment: data[:past_employment],
          twitter_link: data[:twitter_link],
          linked_in_link: data[:linked_in_link],
          github_link: data[:github_link],
          facebook_link: data[:facebook_link],
          ethnicity: data[:ethnicity],
          orientation: data[:orientation]
        }
      })

      params.require(:user).permit(:name, :bio, :email, :location, :area_of_interest, :years_of_expertise, :past_employment, :twitter_link, :linked_in_link, :github_link, :facebook_link, :ethnicity, :orientation)
      #params.fetch(:user, {})
    end
end
