class ChangeColumnNameInterest < ActiveRecord::Migration[5.1]
  def change
    rename_column :interests, :publishing_company_id, :author_id
  end
end
