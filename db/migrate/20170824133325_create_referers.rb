class CreateReferers < ActiveRecord::Migration[5.1]
  def change
    create_table :referers do |t|
      t.string :url, index: true
      t.timestamps
    end
  end
end
