class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.references :url, index: true
      t.string :user_session_id, index: true
      t.string :ip_address
      t.string :http_referer
      t.string :user_agent
      t.datetime :created_at
    end
  end
end
