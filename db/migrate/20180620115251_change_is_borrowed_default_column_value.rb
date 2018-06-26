class ChangeIsBorrowedDefaultColumnValue < ActiveRecord::Migration[5.1]
  def change
    change_column_default :books, :is_borrowed, false
  end
end
