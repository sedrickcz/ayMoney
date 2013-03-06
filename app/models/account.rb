class Account < ActiveRecord::Base
  attr_accessible :active, :description, :title

  validates :title, presence: true, uniqueness: true

  has_many :cash_flows

  def total_sum
    cash_flows.sum(:amount)
  end

  def to_s
    title
  end
end
