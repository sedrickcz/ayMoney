class Category < ActiveRecord::Base
  attr_accessible :active, :description, :title

  validates :title, presence: true, uniqueness: true

  has_many :cash_flows

  def to_s
    title
  end
end
