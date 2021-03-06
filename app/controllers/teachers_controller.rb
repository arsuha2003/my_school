class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
    if params[:teacher_id]
      @teachers = @teachers.where(teacher_id: params[:teacher_id])
      @teacher = TeacherLevel.find(params[:teacher_id])
    end
    @teachers = @teachers.page(params[:page])
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def new
    @teacher = Teacher.new
  end

  def update
    @teacher = Teacher.find(params[:id])

    if @teacher.update(teacher_params)
      redirect_to @teacher
    else
      render 'edit'
    end
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      redirect_to @teacher
    else
      render 'new'
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    redirect_to teachers_path
  end

  private

  def teacher_params
    params.require(:teacher).permit(:snils, :user_id, subject_ids: [], grade_level_ids: [])
  end
end
