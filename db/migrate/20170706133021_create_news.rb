class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :title, null: false
      t.string :summary
      t.text :content

      t.integer :user_id
      t.timestamps
    end
  end
end
