class Article < ApplicationRecord
    validates :title, presence: true, length: { min: 6, maximum: 100}
    validates :description, presence: true, length: { min: 10, maximum: 1000}
end