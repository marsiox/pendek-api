class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
      t.integer :year
      t.integer :month
      t.references :url
      t.references :referer
      t.bigint :visits
    end
  end
end
