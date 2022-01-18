class ChangeDefaultNameInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :first_name, "first_name"
    change_column_default :users, :last_name, "last_name"
  end
end
