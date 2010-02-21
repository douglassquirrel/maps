class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.string :map_content_type
      t.binary :map_data

      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end
