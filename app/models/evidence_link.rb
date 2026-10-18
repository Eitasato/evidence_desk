class EvidenceLink < ApplicationRecord
  DECISIONS = %w[採用 保留 却下].freeze

  belongs_to :question
  belongs_to :passage

  validates :decision, inclusion: { in: DECISIONS }
end
