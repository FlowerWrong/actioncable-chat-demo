class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.belongs_to :chatroom, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
