# frozen_string_literal: true

class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  # after_create_commit -> { broadcast_prepend_to 'quotes'}
  # after_update_commit -> { broadcast_replace_to 'quotes'}
  # after_destroy_commit -> { broadcast_remove_to 'quotes'}
  broadcasts_to ->(_quote) { 'quotes' }, inserts_by: :prepend
end
