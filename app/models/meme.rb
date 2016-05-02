class Meme < ActiveRecord::Base
  has_many :orders

  validates :height, presence: true, numericality: { only_integer: true }
  validates :width, presence: true, numericality: { only_integer: true }

  validate :proportionality

  MEME_NOT_TOO_TALL = 0.4
  MEME_NOT_TOO_WIDE = 1.1

  def meme_will_fit_on_shirt
    ((height.to_f / width.to_f) >= MEME_NOT_TOO_TALL) && ((height.to_f / width.to_f) <= MEME_NOT_TOO_WIDE)
  end

  def proportionality
    errors.add(:proportionality, 'is needed for a good memeshirt meme') unless meme_will_fit_on_shirt
  end
end
