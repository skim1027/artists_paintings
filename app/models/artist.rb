class Artist < ApplicationRecord
  has_many :paintings

  def number_of_paintings
    self.paintings.count
  end
end