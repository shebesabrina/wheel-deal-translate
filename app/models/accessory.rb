class Accessory < ApplicationRecord
  validates :description, presence: true
  validates_uniqueness_of :title
  validates_numericality_of :price, :on => :create
  belongs_to :user, optional: true
  
  enum role:[:active, :inactive]
end
