class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :full
      t.string :short
      t.timestamps
    end
  end
end
