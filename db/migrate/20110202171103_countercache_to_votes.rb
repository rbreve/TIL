class CountercacheToVotes < ActiveRecord::Migration
  def self.up
      add_column :snippets, :votes_count, :integer, :default=>0
  end

  def self.down
  end
end
