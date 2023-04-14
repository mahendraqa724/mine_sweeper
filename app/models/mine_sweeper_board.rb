class MineSweeperBoard < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :total_mines, numericality: { greater_than_or_equal_to: 0 }
  validate :max_mines
  validates :board_width, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :board_height, numericality: { greater_than_or_equal_to: 0 }
  
  def max_mines
    if (board_width.to_i * board_height.to_i) < total_mines.to_i
      errors.add(:base, 'total mines must be less than or equals to total cells')
    end
  end
end
