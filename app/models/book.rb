class Book < ApplicationRecord

  belongs_to :user
  attachment :image

  validates :title, presence: true
  validates :opinion, presence: true
  validates :name, presence: true

end
