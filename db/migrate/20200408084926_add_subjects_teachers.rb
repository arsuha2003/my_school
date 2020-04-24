class AddSubjectsTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects_teachers do |t|
      t.references :teacher, foreign_key: true
      t.references :subject, foreign_key: true
    end
  end
end
