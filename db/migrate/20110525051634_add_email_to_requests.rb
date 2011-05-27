class AddEmailToRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :email, :string
  end

  def self.down
    remove_column :requests, :email
  end
end
