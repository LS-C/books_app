class ChangeColumnNameAgainBooks < ActiveRecord::Migration[5.1]
  def change
    rename_column :books, :synopsis, :description
  end
end
