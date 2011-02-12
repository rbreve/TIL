class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.integer :snippet_id
      t.integer :user_id
      t.text :reason

      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
