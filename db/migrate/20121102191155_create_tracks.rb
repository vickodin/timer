class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :project_id, :null => false
      t.datetime :stopped_at

      t.timestamps
    end
  end
end
