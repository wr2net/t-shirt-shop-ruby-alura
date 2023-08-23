class Product < ApplicationRecord

  belongs_to :departament

  validates :name, length: { minimum: 5 }, presence: true
  validates :price, presence: true
  validates :quantitiy, presence: true

end
