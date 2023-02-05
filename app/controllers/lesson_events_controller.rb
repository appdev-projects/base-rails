class LessonEventsController < ApplicationController
  before_action :set_lesson_event, only: %i[ show edit update destroy ]

  # GET /lesson_events or /lesson_events.json
  def index
    @lesson_events = LessonEvent.all
  end

  # GET /lesson_events/1 or /lesson_events/1.json
  def show
  end

  # GET /lesson_events/new
  def new
    @lesson_event = LessonEvent.new
  end

  # GET /lesson_events/1/edit
  def edit
  end

  # POST /lesson_events or /lesson_events.json
  def create
    @lesson_event = LessonEvent.new(lesson_event_params)

    respond_to do |format|
      if @lesson_event.save
        format.html { redirect_to lesson_event_url(@lesson_event), notice: "Lesson event was successfully created." }
        format.json { render :show, status: :created, location: @lesson_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_events/1 or /lesson_events/1.json
  def update
    respond_to do |format|
      if @lesson_event.update(lesson_event_params)
        format.html { redirect_to lesson_event_url(@lesson_event), notice: "Lesson event was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_events/1 or /lesson_events/1.json
  def destroy
    @lesson_event.destroy

    respond_to do |format|
      format.html { redirect_to lesson_events_url, notice: "Lesson event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_event
      @lesson_event = LessonEvent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_event_params
      params.require(:lesson_event).permit(:seeker_id, :lesson_id, :status)
    end
end
