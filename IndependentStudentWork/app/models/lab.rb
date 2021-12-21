class Lab < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 250 }
  validates :description, presence: true, length: { maximum: 500 }
   validates :grade, allow_nil: true, format: { with: /[A-F]/}
end
