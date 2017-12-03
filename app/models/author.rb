class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :books
    has_many :interests


    def full_name
        self.first_name.capitalize + " " +self.last_name.capitalize
    end

end
