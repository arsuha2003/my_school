class AddGradeLevelsSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :grade_levels_subjects do |t|
      t.references :grade_level, foreign_key: true
      t.references :subject, foreign_key: true
    end
  end
end