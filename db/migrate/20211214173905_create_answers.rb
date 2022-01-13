class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.integer :talk_id
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :talk, null: false, foreign_key: true
      t.integer :user_id
      t.timestamps
    end
  end
end
