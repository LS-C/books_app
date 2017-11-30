class CreatePublishingCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :publishing_companies do |t|
        t.string :company_name
        t.string :username

      t.timestamps
    end
  end
end
