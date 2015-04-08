class CreateMessageLogs < ActiveRecord::Migration
  def change
    create_table :message_logs do |t|
      t.integer :id
      t.string :name
      t.string :text
      t.string :time

      t.timestamps
    end
  end
end
