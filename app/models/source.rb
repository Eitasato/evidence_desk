class Source < ApplicationRecord
  has_many :passages, dependent: :destroy
  normalizes :url, with: ->(url) { url.presence }
  validates :url, uniqueness: true, allow_nil: true
  has_many :passages, dependent: :destroy
  normalizes :url, with: ->(url) { url.presence }
  validates :url, uniqueness: true, allow_nil: true
end
