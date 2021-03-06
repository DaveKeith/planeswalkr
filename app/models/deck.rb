class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards, through: :deck_cards
  has_many :deck_cards

  validates :user_id, presence: true
  validates :title, presence: true, uniqueness: {
              scope: :user_id
            }

  def add_cards(cards)
    deck_cards = cards.map do |name, quantity|
      card = Card.find_by(name: name)
      deck_card = DeckCard.new(card_id: card.id, quantity: quantity)
    end
    self.deck_cards = self.deck_cards + deck_cards
  end

  def sample_deck
    self.cards.sample(7)
  end
end

#deck.add_cards([["Forest", 3], ["Plague Rats", 2], ["Bad Moon", 1]])
