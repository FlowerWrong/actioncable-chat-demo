class CreateChatroomUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :chatroom_users do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :chatroom, foreign_key: true

      t.timestamps
    end
  end
end
