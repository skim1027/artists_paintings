class Artist < ApplicationRecord
  has_many :paintings, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :year_born
  validates_presence_of :country
  validates :alive, inclusion: [true, false]
  
  def number_of_paintings
    paintings.count
  end

  def painting_sort
    paintings.order(name: :asc)
  end

  def painting_search(year)
    # 
    paintings.where("year_painted > ?", year)
  end

  def self.order_by_created
    order(created_at: :desc)
  end

  def self.order_by_paintings
    joins(:paintings).group(:id).order("COUNT(paintings.id) DESC")

  end
end