class Painting < ApplicationRecord
  belongs_to :artist

  validates_presence_of :name
  validates_presence_of :year_painted
  validates :oil_painting, inclusion: [true, false]
end