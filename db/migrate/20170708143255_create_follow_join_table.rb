class CreateFollowJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table 'follow' do |t|
      t.integer 'followee_id', :null => false
      t.integer 'follower_id', :null => false

      t.timestamps null: false
    end

    add_index :follow, :followee_id
    add_index :follow, :follower_id
    add_index :follow, [:followee_id, :follower_id], unique: true
  end
end
