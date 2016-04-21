class CardSet < ActiveRecord::Base
  has_many :cards

  validates :code, presence: true, uniqueness: true

end
