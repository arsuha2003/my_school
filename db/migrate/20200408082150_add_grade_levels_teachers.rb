class AddGradeLevelsTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :grade_levels_teachers do |t|
      t.references :teacher, foreign_key: true
      t.references :grade_level, foreign_key: true
    end
  end
end
