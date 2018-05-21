class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.string :log_details
      t.belongs_to :book, index: true
      t.belongs_to :user, index: true
      t.string :log_type
      t.date :date_added
      t.timestamps
    end
  end
end
