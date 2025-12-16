# documentalcases

This repository stores evidence and analysis materials for the Truthkeeper project, which documents Mark Jäckel's legal battle to regain contact with his son Nicolas. Use the included onboarding notes before making changes to avoid breaking existing workflows.

## Key documentation
- **TRUTHKEEPER_ONBOARDING.md** outlines the mission, data sources, and non-technical guidelines for working with the case material.
- **2025-12-15_Truthkeeper-Audio-Integration-Verstaendnis.md** captures the current understanding of how audio transcripts should be integrated without altering existing database structures.

## Repository layout
- `original/` contains source PDFs such as court records, police reports, and correspondence.
- `extracted/` holds text extractions of the documents for easier searching and analysis.
- `evidence/` stores supplementary proof assets, including the central `INDEX_DER_BEWEISE.md` and supporting images.
- `persons/` keeps person-focused research. `ANALYSE_ROUTINE.md` documents the standard workflow, while subfolders like `Lena_Kuhn/` and `Staatsanwalt_Carius/` collect individual dossiers.
- `ANALYSE/` and other dated Markdown files provide additional context on the investigation and historical sessions.

## Working notes
- Follow the patterns in `persons/ANALYSE_ROUTINE.md` when adding or updating person dossiers so evidence and audio references stay consistent.
- Do not alter database schemas or ingestion processes without explicit approval; the current materials prioritize documentation and analysis over implementation.
