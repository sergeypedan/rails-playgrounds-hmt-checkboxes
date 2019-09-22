# frozen_string_literal: true

class Tag < ApplicationRecord

  # Validations

  validates :name, presence: true


  # Associations

  has_many :taggings, dependent: :destroy
  has_many :articles, through: :taggings

end
