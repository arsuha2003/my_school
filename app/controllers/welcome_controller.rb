class WelcomeController < ApplicationController
  def index
    @grade_level_count = GradeLevel.count
    @grade_count = Grade.count
    @subject_count = Subject.count
    @user_count = User.count
  end
end
