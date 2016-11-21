class Product < ActiveRecord::Base
  has_many :components, inverse_of: :product

  validates :name, format: {with: /card/i, message: "must contain *card*!"}

  accepts_nested_attributes_for :components
end
