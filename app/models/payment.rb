class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :category_payments
  has_many :categories, through: :category_payments

  validates :name, presence: true
  validates :amount, presence: true, numericality: true
end
