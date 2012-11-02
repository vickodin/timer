class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, :null => false
      t.text :description
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
