class Passage < ApplicationRecord
  has_many :evidence_links, dependent: :destroy
  has_many :evidence_links, dependent: :destroy
  belongs_to :source
end
