class AddParentsStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :parents_students do |t|
      t.references :parent, foreign_key: true
      t.references :student, foreign_key: true
      t.timestamps
    end
  end
end
