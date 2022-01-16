class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :talk_id
      t.integer :answer_id
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
