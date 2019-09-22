# frozen_string_literal: true

class Tagging < ApplicationRecord

  # Associations

  belongs_to :article # , inverse_of: :taggings
  belongs_to :tag     # , inverse_of: :taggings


  # Validations

  validates :article_id, numericality: { only_integer: true, greater_than: 0 }
  validates :tag_id,     numericality: { only_integer: true, greater_than: 0 }

end
