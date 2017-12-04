class Book < ApplicationRecord
    belongs_to :author

    has_many :interests
    has_many :publishing_companies, through: :interests

    def full_title
        self.title.split.map(&:capitalize).join(' ')
    end


    def interest
        @book = Book.find(params[:id])
        @book.update_interests(current_publishing_company)
        redirect_to root_path
    end


    def update_interests(publishing_company)
        publishing_company_interested?(publishing_company) ? uninterest(publishing_company) : interest(publishing_company)
    end

    def interests_message(publishing_company)
      if !publishing_company_interested?(publishing_company)
        "<strong>#{self.interests.count} people</strong> interest this image".html_safe
      else
        "<strong>You</strong> and <strong>#{self.interests.count - 1} other people</strong> interest this image".html_safe
      end
    end

    def heart_class(publishing_company)
      if publishing_company_interested?(publishing_company)
        "heart icon"
      else
        "empty heart icon"
      end
    end

    private
    def publishing_company_interested?(publishing_company)
      self.interests.where(publishing_company: publishing_company).any?
    end

    def interest(publishing_company)
      self.interests.create(publishing_company_id: publishing_company.id)
    end

    def unlike(publishing_company)
      self.interests.find_by(publishing_company_id: publishing_company.id).destroy
    end



end
