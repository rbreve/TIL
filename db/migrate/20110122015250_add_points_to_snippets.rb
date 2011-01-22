class AddPointsToSnippets < ActiveRecord::Migration
  def self.up
    add_column :snippets, :points, :integer, :default=>0
    add_column :snippets, :views, :integer, :default=>0
  end

  def self.down
    remove_column :snippets, :views
    remove_column :snippets, :points
  end
end
