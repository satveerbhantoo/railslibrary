class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :synopsis
      t.string :publisher
      t.date :published_date
      t.string :img_url
      t.boolean :is_borrowed
      t.date :date_borrowed
      t.belongs_to :library, index: true
      t.belongs_to :user, index: true, optional: true
      t.timestamps
    end
  end
end
