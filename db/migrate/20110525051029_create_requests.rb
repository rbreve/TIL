class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.integer :user_id
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end
