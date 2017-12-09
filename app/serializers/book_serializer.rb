class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :category, :description, :created_at
  belongs_to :author, serializer: BookAuthorSerializer
  has_many :interests
end
