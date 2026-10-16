class EvidenceLink < ApplicationRecord
  belongs_to :question
  belongs_to :passage
end
