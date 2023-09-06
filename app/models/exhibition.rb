class Exhibition < ApplicationRecord
  has_many :bookmark_exhibitions, dependent: :destroy
  has_many :exhibitions, through: :bookmark_exhibitions
  has_many :entry_artists, dependent: :destroy
  has_many :artists, through: :entry_artists
  belongs_to :museum
  
  has_many_attached :exhibition_images, default_url: Rails.root.join("app/assets/images/default_exhibition_image.jpeg")

  validates :exhibition_name, presence: true
  validates :introduction, presence: true, length: { maximum: 255 }
  validates :official_website, presence: true
  validates :is_active, presence: true, inclusion: { in: [true, false] }
  validate :validate_exhibition_images_count
  
  def get_exhibition_images(width, height)
    if exhibition_images.attached?
      exhibition_images.variant(resize_to_limit: [width, height]).processed
    else
      ActionController::Base.helpers.asset_path("default_exhibition_image.jpeg")
    end
  end

  private

  def validate_exhibition_images_count
    if exhibition_images.attached? && exhibition_images.length > 4
      errors.add(:exhibition_images, "は最大4つまでです")
    end
  end
end