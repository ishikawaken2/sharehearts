class AddUserIdToEmpathies < ActiveRecord::Migration[6.1]
  def change
    add_column :empathies, :user_id, :integer
  end
end
