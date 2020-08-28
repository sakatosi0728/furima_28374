class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :title, :text, :genre, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id
  end
end
