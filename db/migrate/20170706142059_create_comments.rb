class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|

      t.string :comment, null: false
      t.integer :user_id
      t.integer :news_id

      t.timestamps
    end
  end
end
