class InterestSerializer < ActiveModel::Serializer
  attributes :id, :publishing_company_id, :book_id
  belongs_to :publishing_companies
  belongs_to :books
end
