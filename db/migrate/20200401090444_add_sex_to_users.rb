class AddSexToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sex, :integer, default: 0
  end
end
