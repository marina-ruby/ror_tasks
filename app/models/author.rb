class Author < ApplicationRecord

  # attr_accessor :name
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 3 }


  has_many :articles, dependent: :destroy

  # def initialize
  #   self.name = "Anonimous"
  # end
end
