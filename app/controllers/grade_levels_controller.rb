class GradeLevelsController < ApplicationController
  def index
    @grade_levels = GradeLevel.all
  end

  def show
    @grade_level = GradeLevel.find(params[:id])
  end

  def edit
    @grade_level = GradeLevel.find(params[:id])
  end

  def new
    @grade_level = GradeLevel.new
  end

  def update
    @grade_level = GradeLevel.find(params[:id])

    if @grade_level.update(grade_level_params)
      redirect_to @grade_level
    else
      render 'edit'
    end
  end

  def create
    @grade_level = GradeLevel.new(grade_level_params)

    if @grade_level.save
      redirect_to @grade_level
    else
      render 'new'
    end
  end

  def destroy
    @grade_level = GradeLevel.find(params[:id])
    @grade_level.destroy

    redirect_to grade_levels_path
  end

  private

  def grade_level_params
    params.require(:grade_level).permit(:level, subject_ids: [], teacher_ids: [])
  end
end
