class PitchesController < ApplicationController
  before_action :set_pitch, only: [:show, :edit, :update, :destroy]

  # GET /pitches
  # GET /pitches.json
  include PitchesHelper
  def index
    @pitches = Pitch.all
  end

  # GET /pitches/1
  # GET /pitches/1.json
  def show
    @pitch = Pitch.find_by_id(params[:id])

    @feedback_list = Feedback.where(pitch_id: params[:id]).order('id DESC')
    @feedback = Feedback.new
  end

  # GET /pitches/new
  def new
    @pitch = Pitch.new
  end

  # GET /pitches/1/edit
  def edit
  end

  # POST /pitches
  # POST /pitches.json
  def create

    # if current_user
    # Pitch.create(user_id: current_user.id, title: params[:title], description: params[:description], category: params[:category], looking_for: params[:looking_for])
    # redirect_to '/pitches'
    # else
    #   redirect_to '/pitches/new'
    # end
    data = params[:pitch]
    @pitch = Pitch.new(pitch_params(data))
    # @pitch.save
    respond_to do |format|
      if @pitch.save
        format.html { redirect_to @pitch, notice: 'Pitch was successfully created.' }
        format.json { render :show, status: :created, location: @pitch }
      else
        format.html { render :new }
        format.json { render json: @pitch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pitches/1
  # PATCH/PUT /pitches/1.json
  def update
    respond_to do |format|
      if @pitch.update(pitch_params)
        format.html { redirect_to @pitch, notice: 'Pitch was successfully updated.' }
        format.json { render :show, status: :ok, location: @pitch }
      else
        format.html { render :edit }
        format.json { render json: @pitch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pitches/1
  # DELETE /pitches/1.json
  def destroy
    @pitch.destroy
    respond_to do |format|
      format.html { redirect_to pitches_url, notice: 'Pitch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pitch
      @pitch = Pitch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pitch_params data
      data[:looking_for].delete("0")
      params = ActionController::Parameters.new({
      pitch: {
        user_id: current_user.id,
        title: data[:title],
        description: data[:title],
        category: data[:category],
        looking_for: data[:looking_for].to_s
      }
    })

      params.require(:pitch).permit(:user_id, :title, :description, :category, :looking_for)
      #params.fetch(:pitch).permit(:user_id, :title, :description, :category, :looking_for)
    end
end
