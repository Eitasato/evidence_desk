# Evidence Desk

English | [日本語](README.ja.md)

**Live demo:** https://evidence-desk-903886626513.asia-northeast1.run.app/
(The first load may take about 30 seconds. See Known limitations.)

## What it is

Evidence Desk is an app for building up questions and the sources that support their answers. I built it because, while researching for SEO articles, I wanted an index that organized my research materials.

When you start researching, you register the questions that come to mind, and as you read, you record the paragraphs and passages that help answer them. For web articles and columns, you note the title and URL, the passage you want to use, and the heading of the section it appears under; for papers, slide decks, and the like, the page and paragraph numbers.

Each paragraph linked to a question gets a decision (Adopted, Pending, or Rejected) and a note explaining why. Researching and archiving happen in the same step.

By recording not only the titles and URLs of the sources you used, but also the passages themselves and where they appear, the app aims to let you get back to the evidence behind an answer quickly.

## How it works

Starting from a question, you can trace the paragraphs and passages that may support an answer, the sources they come from, and where in each source they appear.

The database has four tables: Source, Passage, Question, and EvidenceLink. Source holds the sources, Passage the paragraphs taken from them, and Question the questions. EvidenceLink records which paragraph was linked to which question as evidence, and which decision was made, together with the reason. Because every paragraph belongs to a source, each evidence link leads through its paragraph to the source as well.

A single question can be linked to as many paragraphs and sources as needed. The same paragraph can also be linked to several questions, with a different decision for each.

## Design decisions

The idea of recording everything with a question as the starting point comes from how I work: I build articles around what readers need to know. It also grew out of a problem I have as a reader: how to record what a book says, and how to connect separate books to one another.

Rejected paragraphs are recorded too. Archiving these judgments should make it possible to see what the sources I set aside have in common, and eventually to turn that into screening criteria.

Because sources, paragraphs, and evidence links depend on one another, deleting a source also deletes its paragraphs and their evidence links. Sources are normally registered with a URL, but the URL can be left blank for books.

## Running locally

With Ruby 3.2.3 installed, run the following commands in order.

```
git clone https://github.com/Eitasato/evidence_desk.git
cd evidence_desk
bundle install
bin/rails db:prepare
bin/rails server
```

Then open http://localhost:3000 in your browser. `bin/rails db:prepare` creates the database and loads the sample data, so the app starts with a sample question and its sources. Run the tests with `bin/rails test`.

## Deployment

The demo runs on Google Cloud Run (Tokyo region). The container image is built from the Dockerfile that Rails generates, using `gcloud run deploy --source .`.

Cloud Run terminates HTTPS and forwards requests to the container over HTTP. Rails then believes it is running on HTTP and rejects form submissions coming from the HTTPS page, so `config.assume_ssl` is enabled.

Requests that arrived before Rails had finished booting used to return errors, so Cloud Run uses `/up` as its startup check and waits until Rails can respond before sending traffic. Because each container has its own database, the service is limited to a single instance.

## Known limitations

The demo is published as a sample, so its data returns to the initial state whenever the container restarts. Cloud Run discards a container's contents when it stops, so any data you registered is deleted as well. To keep your data, clone the repository and run the app locally. Keeping data on the hosted demo would require an external database such as Cloud SQL.

The container also stops after a period without traffic, so the first page can take about 30 seconds to load. If it does not appear, please reload the page.

The master key is passed as an environment variable; ideally it would be managed with Secret Manager. The app uses Ruby 3.2, which is no longer supported, and an upgrade is planned.

The screens are the ones Rails scaffolding generates for each table, used as they are. Registering paragraphs takes effort, and that turned out to be the biggest issue once I started using the app. Reworking the screens, such as removing the detail pages for sources and paragraphs and clarifying how the evidence list differs from the question page, is planned.
