class Book < ApplicationRecord
    belongs_to :author

    has_many :interests
    has_many :publishing_companies, through: :interests

    def full_title
        self.title.split.map(&:capitalize).join(' ')
    end


    def update_interests(publishing_company)
        publishing_company_interested?(publishing_company) ? not_interested(publishing_company) : interest(publishing_company)
    end

    def interests_message(publishing_company)
      if !publishing_company_interested?(publishing_company)
        if self.interests.count == 1
          "<strong>#{self.interests.count} company </strong> is interested".html_safe
        else
          "<strong>#{self.interests.count} companies </strong> are interestest".html_safe
        end
      else
        if self.interests.count-1 == 1
          "<strong>You</strong> and <strong>#{self.interests.count - 1} other company </strong> is interested".html_safe
        else
          "<strong>You</strong> and <strong>#{self.interests.count - 1} other companies </strong> are interested".html_safe
        end
      end
    end

    def heart_class(publishing_company)
      publishing_company_interested?(publishing_company) ? "heart icon" : "empty heart icon"
    end

    private
    def publishing_company_interested?(publishing_company)
      self.interests.where(publishing_company: publishing_company).any?
    end

    def interest(publishing_company)
      self.interests.create(publishing_company_id: publishing_company.id)
    end

    def not_interested(publishing_company)
      self.interests.find_by(publishing_company_id: publishing_company.id).destroy
    end



end
