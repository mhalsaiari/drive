class CreateBlobs < ActiveRecord::Migration[7.1]
  def change
    create_table :blobs, id: false do |t|
      t.string :id, primary_key: true
      t.binary :data
      t.integer :size
      t.timestamps
    end
  end
end
