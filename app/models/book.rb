class Book < ApplicationRecord
    belongs_to :author

    has_many :interests

    def full_title
        self.title.split.map(&:capitalize).join(' ')
    end

end
