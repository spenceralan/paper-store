class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, :description, presence: true

  validates :price,
    presence: true,
    numericality: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
