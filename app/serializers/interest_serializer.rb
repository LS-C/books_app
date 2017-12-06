class InterestSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :publishing_company
  belongs_to :book
end
