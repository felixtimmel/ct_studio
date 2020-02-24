class Category < ApplicationRecord
  has_many :designs, through: :design_categories

  validates :name, presence: true, inclusion: { in: ["Abstract", "Animal", "Colors", "Floral", "Geometry", "Illustration", "Kids", "Monochrome", "Placement"] }
end
