json.extract! evidence_link, :id, :question_id, :quote_id, :decision, :note, :created_at, :updated_at
json.url evidence_link_url(evidence_link, format: :json)
