class CreateInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :interests do |t|
        t.integer :publishing_company_id
        t.integer :book_id

      t.timestamps
    end
  end
end
