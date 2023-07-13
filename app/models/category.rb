class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :category_payments
  has_many :payments, through: :category_payments

  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true

  def total_payments
    payments.sum(:amount)
  end
end
