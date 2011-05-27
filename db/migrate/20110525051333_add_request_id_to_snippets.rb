class AddRequestIdToSnippets < ActiveRecord::Migration
  def self.up
    add_column :snippets, :request_id, :integer
  end

  def self.down
    remove_column :snippets, :request_id
  end
end
