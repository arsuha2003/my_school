class GradesController < ApplicationController
  before_filter :authenticate_user!, except => %i[show index]
  def index
    @grades = Grade.all
    if params[:grade_level_id]
      @grades = @grades.where(grade_level_id: params[:grade_level_id])
      @grade_level = GradeLevel.find(params[:grade_level_id])
    end
    @grades = @grades.page(params[:page])
  end

  def show
    @grade = Grade.find(params[:id])
  end

  def edit
    @grade = Grade.find(params[:id])
  end

  def new
    @grade = Grade.new
  end

  def update
    @grade = Grade.find(params[:id])

    if @grade.update(grade_params)
      redirect_to @grade
    else
      render 'edit'
    end
  end

  def create
    @grade = Grade.new(grade_params)

    if @grade.save
      redirect_to @grade
    else
      render 'new'
    end
  end

  def destroy
    @grade = Grade.find(params[:id])
    @grade.destroy

    redirect_to grades_path
  end

  private

  def grade_params
    params.require(:grade).permit(:letter, :grade_level_id)
  end
end
