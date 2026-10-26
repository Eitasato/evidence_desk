class EvidenceLink < ApplicationRecord
  DECISIONS = %w[Adopted Pending Rejected].freeze

  belongs_to :question
  belongs_to :passage

  validates :decision, inclusion: { in: DECISIONS }
end
