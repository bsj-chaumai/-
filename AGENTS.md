# AGENTS.md

## Cursor Cloud specific instructions

This repository is **documentation-only**. It contains no application code, no
package manifests, no build/test/lint tooling, and no external service
dependencies. Do not look for a backend, frontend, database, or CI pipeline —
there is none.

### Contents
- `QD_Framework_Output_Chuan_Theo_Giai_Doan.{md,html,mm}` — the QD Framework
  delivery-gate document in three formats (Markdown source, self-contained
  static HTML page, and FreeMind mindmap). These three are meant to stay in sync.
- `社員ID_チャウ（AR）｜A2（H1）最終活動報告.md` and various `.docx` — HR/activity
  reports (Vietnamese/Japanese).

### Working with it (no dependencies to install)
- The primary "product" is the static HTML doc. Preview it by serving the repo
  with any static file server, e.g. `python3 -m http.server 8000`, then open
  `http://localhost:8000/QD_Framework_Output_Chuan_Theo_Giai_Doan.html`.
  Python 3 and Node are already available; no install step is required.
- There are no lint, test, or build commands. Editing is just editing Markdown/
  HTML. If you change the framework content, update all three formats
  (`.md`, `.html`, `.mm`) so they remain consistent.
