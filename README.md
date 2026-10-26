# Evidence Desk

A small Rails app for tracing every claim in an SEO content outline back to the exact paragraph and source that supports it.

**Live demo:** https://evidence-desk-903886626513.asia-northeast1.run.app/
<!-- Note: demo data resets when the container restarts. -->

## What it is
<!-- The problem: in outline work, claims lose their link to the source. Who uses it, and for what. -->

## How it works

### Data model
<!-- Source, Passage, Question, EvidenceLink. Why the app is read in one direction: Question -> EvidenceLink -> Passage -> Source. -->

### What happens when you open a question
<!-- URL -> routes -> controller -> model -> database (SQL) -> view, using /questions/1 as the example. -->

## Design decisions
<!-- Start from the question. Record rejected evidence too. Deleting a source cascades. Sources without a URL (books). -->

## Deployment
<!-- Docker image built from the Rails Dockerfile. Cloud Run settings and why: port, max 1 instance, no CPU throttling, master key, data reset. -->

## What I learned
<!-- 422: Origin was https but Rails saw http (assume_ssl). 502: Cloud Run throttled CPU while Rails was still booting. CI broke when GitHub moved ubuntu-latest. A gem vulnerability (crass) published two days earlier. -->

## Next steps
<!-- Ruby upgrade, require a note when rejecting, prevent duplicate passages, simplify Source/Passage screens, clarify the evidence list vs. the question page. -->

## Running locally
<!-- Ruby 3.2.3, Rails 8.1.4, SQLite. bundle install, bin/rails db:prepare, bin/rails server. -->
