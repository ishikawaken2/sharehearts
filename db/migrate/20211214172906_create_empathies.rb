class CreateEmpathies < ActiveRecord::Migration[6.1]
  def change
    create_table :empathies do |t|
      # t.integer :talk_id
      # t.integer :user_id
      t.references :talk, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
