class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  def edit
    @feedback = Feedback.find(params[:id])
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    data = params[:feedback]
    @feedback = Feedback.new(feedback_params(data))
    # @pitch.save
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to "/pitches/#{data[:pitch_id]}", notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render "/pitches/#{data[:pitch_id]}" }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy

    pitch = Feedback.find_by(id: params[:id]).pitch.id
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to "/pitches/#{pitch}"}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id]) || nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params data
      params = ActionController::Parameters.new({
      feedback: {
        user_id: current_user.id,
        pitch_id: data[:pitch_id],
        content: data[:content]
      }
    })
      params.require(:feedback).permit(:user_id, :pitch_id, :content)
    end
end
