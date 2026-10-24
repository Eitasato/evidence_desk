# Demo data. Loaded automatically when the database is created (bin/rails db:prepare).
# Safe to run more than once: existing records are found, not duplicated.

question = Question.find_or_create_by!(body: "What makes a source trustworthy enough to cite?")

guideline = Source.find_or_create_by!(url: "https://example.com/editorial-guideline") do |s|
  s.title = "Sample editorial guideline (demo)"
  s.source_type = "guideline"
end

blog = Source.find_or_create_by!(url: "https://example.com/seo-tips") do |s|
  s.title = "Sample blog post (demo)"
  s.source_type = "blog"
end

primary = Passage.find_or_create_by!(source: guideline, page_index: 2, paragraph_index: 1) do |p|
  p.heading_path = "Sources > Primary sources"
  p.body = "Prefer primary sources: the original study, the official statistics, or the statement of the organization itself. Secondary summaries may drop the conditions under which a claim holds."
end

secondary = Passage.find_or_create_by!(source: guideline, page_index: 2, paragraph_index: 3) do |p|
  p.heading_path = "Sources > When no primary source exists"
  p.body = "If a primary source cannot be found, state which secondary source was used and when it was accessed."
end

popularity = Passage.find_or_create_by!(source: blog, page_index: 1, paragraph_index: 5) do |p|
  p.heading_path = "Tips"
  p.body = "Any page with many backlinks can be trusted."
end

EvidenceLink.find_or_create_by!(question: question, passage: primary) do |l|
  l.decision = "採用"
  l.note = "States the core rule. Use it as the basis of the outline."
end

EvidenceLink.find_or_create_by!(question: question, passage: secondary) do |l|
  l.decision = "保留"
  l.note = "Useful, but check whether the client allows secondary sources."
end

EvidenceLink.find_or_create_by!(question: question, passage: popularity) do |l|
  l.decision = "却下"
  l.note = "Popularity is not evidence of accuracy. No support is given for the claim."
end
