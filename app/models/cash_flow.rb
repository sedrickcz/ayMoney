class CashFlow < ActiveRecord::Base
  attr_accessible :account_id, :amount, :category_id, :date, :deleted, :description

  validates :date, :category_id, :account_id, presence: true
  validates :amount, presence: true, numericality: true

  belongs_to :category
  belongs_to :account


end
