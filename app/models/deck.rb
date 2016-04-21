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

  def mana_curve
    cost_count = Hash.new
    count = 0
    8.times do
      if count < 7
        deck_card = Card.where(converted_cost == count)
      else
        deck_card = Card.where(converted_cost <= count)
      end
      card_array = Deck_Card.find_by(card_id: deck_card)
      cost_count["converted_mana_cost_#{count}"] = card_array.length
      count += 1
    end
    cost_count
  end
end

#deck.add_cards([["Forest", 3], ["Plague Rats", 2], ["Bad Moon", 1]])
