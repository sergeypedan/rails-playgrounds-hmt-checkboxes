# frozen_string_literal: true

class Article < ApplicationRecord

  # Validations

  validates :title, presence: true


  # Associations

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  # , inverse_of: :article

  accepts_nested_attributes_for :taggings
  accepts_nested_attributes_for :tags

end
