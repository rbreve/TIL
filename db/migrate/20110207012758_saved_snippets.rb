class SavedSnippets < ActiveRecord::Migration
  def self.up
      create_table :saves do |t|
        t.integer :user_id
        t.integer :snippet_id
        t.timestamps
    end
  end

  def self.down
  end
end
