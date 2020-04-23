class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.string :letter
      t.references :grade_level, foreign_key: true

      t.timestamps
    end
  end
end
