class PublishingCompanySerializer < ActiveModel::Serializer
  attributes :id, :company_name
  has_many :interests
end
