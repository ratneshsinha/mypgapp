class Icd < ApplicationRecord
  validates :code, presence: true, length: {minimum:1, maximum:10}
  validates :description, presence: true, length: {minimum:1, maximum:100}
end
