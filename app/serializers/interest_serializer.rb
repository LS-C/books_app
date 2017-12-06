class InterestSerializer < ActiveModel::Serializer
  attributes :id, :publishing_company, :book_id
  belongs_to :publishing_company
end
