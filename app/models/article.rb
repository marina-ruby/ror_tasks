class Article < ApplicationRecord
  has_many :tag
  belongs_to :author, required: true
end
