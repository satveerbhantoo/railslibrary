class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :comment_body
      t.date :date_added
      t.belongs_to :book, index: true, optional: true
      t.timestamps
    end
  end
end
