class Artist < ApplicationRecord
  has_many :paintings

  validates_presence_of :name
  validates_presence_of :year_born
  validates_presence_of :country
  validates :alive, inclusion: [true, false]
  
  def number_of_paintings
    self.paintings.count
  end

  def self.search(search)
    
    if search
      select_paintings = self.paintings.find_by(year_painted: search) 
      if select_paintings
        require 'pry'; binding.pry
        self.where("year_painted")
      end
    elsif (params[:order] == "name")

    else

    end
  end
end