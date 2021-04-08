class Danger < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :content
  end
end
