class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :billboard_id
      t.integer :direction

      t.timestamps null: false
    end
  end
end
