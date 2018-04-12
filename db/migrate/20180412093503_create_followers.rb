class CreateFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :followers do |t|
      t.integer :user_id
      t.string :provider
      t.string :name
      t.string :avatar

      t.timestamps
    end
  end
end
