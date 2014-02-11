class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :owner
      t.integer :likes
      t.integer :ranking

      t.timestamps
    end
  end
end
