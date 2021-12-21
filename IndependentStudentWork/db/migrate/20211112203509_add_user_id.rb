class AddUserId < ActiveRecord::Migration[6.1]
  def change
    add_column :LaboratiryWorks, :user_id, :integer
    add_foreign_key :LaboratiryWorks, :UserInfo
  end
end
