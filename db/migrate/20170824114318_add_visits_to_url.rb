class AddVisitsToUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :visits, :bigint
  end
end
