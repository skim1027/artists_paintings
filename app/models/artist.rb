class Artist < ApplicationRecord
  has_many :paintings, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :year_born
  validates_presence_of :country
  validates :alive, inclusion: [true, false]
  
  def number_of_paintings
    self.paintings.count
  end

  def sort
    self.paintings.order(name: :asc)
  end

  def search(year)
    # 
    self.paintings.where("year_painted > ?", year)
  end

  def order_by_created
    self.order(created_at: :desc)
  end

  def order_by_paintings
    self.order(num_paints: :desc)
  end
end