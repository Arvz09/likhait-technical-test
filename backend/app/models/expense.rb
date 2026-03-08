class Expense < ApplicationRecord
  belongs_to :category

  validate :date_cannot_be_in_the_future

  before_validation :set_default_payer_name

  private

  def date_cannot_be_in_the_future
    errors.add(:date, "can't be in the future") if date.present? && date > Date.today + 1
  end

  def set_default_payer_name
    self.payer_name ||= "System"
  end
end
