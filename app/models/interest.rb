class Interest < ApplicationRecord
    belongs_to :publishing_companies
    belongs_to :books

end
