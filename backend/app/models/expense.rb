class Expense < ApplicationRecord
  belongs_to :category

  # Ensure every expense has a payer_name, even though the UI doesn't capture it.
  before_validation :set_default_payer_name

  private

  def set_default_payer_name
    self.payer_name ||= "System"
  end
end
