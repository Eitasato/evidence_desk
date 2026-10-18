class Question < ApplicationRecord
  has_many :evidence_links, dependent: :destroy
end
