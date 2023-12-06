class Food < ApplicationRecord
  belongs_to :type
  belongs_to :unit
  has_many :items

  def meals
    self.items.map { |item|
      item.meal
    }
  end

  # def days
  #   self.items.map { |item|
  #     item.meal.group(:day)
  #   }
  # end
end
