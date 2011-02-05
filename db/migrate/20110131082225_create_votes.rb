class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.belongs_to :user, :polymorphic => true      
      t.belongs_to :snippet, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
