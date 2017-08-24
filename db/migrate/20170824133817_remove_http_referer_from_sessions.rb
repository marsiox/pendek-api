class RemoveHttpRefererFromSessions < ActiveRecord::Migration[5.1]
  def change
    remove_column :sessions, :http_referer
    add_reference :sessions, :referer, index: true
  end
end
