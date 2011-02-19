class CreateApis < ActiveRecord::Migration
  def self.up
    create_table :apis do |t|
      t.string :tag
      t.text :text

      t.timestamps
    end
  end

  def self.down
    drop_table :apis
  end
end
