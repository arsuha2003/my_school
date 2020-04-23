class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :code
      t.references :user, foreign_key: true
      t.references :grade, foreign_key: true

      t.timestamps
    end
  end
end
