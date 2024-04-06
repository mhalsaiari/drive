class CreateBlobData < ActiveRecord::Migration[7.1]
  def change
    create_table :blob_data do |t|
      t.references :blob, foreign_key: true, type: :string
      t.binary :data

      t.timestamps
    end
  end
end
