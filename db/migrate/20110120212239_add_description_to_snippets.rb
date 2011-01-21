class AddDescriptionToSnippets < ActiveRecord::Migration
  def self.up
    add_column :snippets, :description, :text
  end

  def self.down
    remove_column :snippets, :description
  end
end
