class LessonPackagesController < ApplicationController
  before_action :set_club
  before_action :set_lesson_package, only: %i[ show edit update destroy ]

  # GET /lesson_packages or /lesson_packages.json
  def index
    @lesson_packages = @club.lesson_packages.all
  end

  # GET /lesson_packages/1 or /lesson_packages/1.json
  def show
  end

  # GET /lesson_packages/new
  def new
    @lesson_package = LessonPackage.new
  end

  # GET /lesson_packages/1/edit
  def edit
  end

  # POST /lesson_packages or /lesson_packages.json
  def create
    @lesson_package = @club.lesson_packages.new(lesson_package_params)

    respond_to do |format|
      if @lesson_package.save
        format.html { redirect_to lesson_package_url(uuid: club_params[:uuid], id: @lesson_package.id), notice: "Lesson package was successfully created." }
        format.json { render :show, status: :created, location: @lesson_package }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_packages/1 or /lesson_packages/1.json
  def update
    respond_to do |format|
      if @lesson_package.update(lesson_package_params)
        format.html { redirect_to lesson_package_url(uuid: club_params[:uuid], id: @lesson_package.id), notice: "Lesson package was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson_package }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_packages/1 or /lesson_packages/1.json
  def destroy
    @lesson_package.destroy!

    respond_to do |format|
      format.html { redirect_to lesson_packages_url, notice: "Lesson package was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find_by!(club_params)
    end

    def set_lesson_package
      @lesson_package = LessonPackage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_package_params
      params.require(:lesson_package).permit(:tennis_school_id, :name, :start_date, :description, :costs, :open_for_registration, :register_by, :register_up_to_and_including, :number_of_teaching_weeks, :number_of_minutes_per_lesson, :lessons_per_week, :max_number_of_players, :min_number_of_players, :optimal_number_of_players, :max_number_of_impediments)
    end

    def club_params
      params.permit(:uuid)
    end
end
