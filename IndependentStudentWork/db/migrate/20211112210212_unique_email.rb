class UniqueEmail < ActiveRecord::Migration[6.1]
  def change
    change_table :UserInfo do |u|
      u.index :email, unique: true
      end
  end
end
