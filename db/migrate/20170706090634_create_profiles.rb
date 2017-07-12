class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id

      t.string :name, default: "Real Name"
      t.string :place, default: "ABC"
      t.string :website, default: "http://www.facebook.com/real.name"
      t.text :bio, default: "Text"

      t.timestamps
    end
  end
end
