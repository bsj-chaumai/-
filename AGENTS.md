# AGENTS.md

## Cursor Cloud specific instructions

This repository is **documents only** — it contains Japanese activity/performance
reports, not a software project. There is no application, package manager,
build system, test suite, or linter here.

Contents:

- `社員ID_チャウ（AR）｜A2（1月〜5月）活動報告.docx` — monthly (Jan–May) activity reports (Word).
- `週報6月まとめ.docx` — June weekly-report summary (Word).
- `社員ID_チャウ（AR）｜A2（H1）最終活動報告.md` — H1 final activity report (Markdown).

Implications for future agents:

- There is nothing to install, build, lint, test, or run. Do not invent a
  build/test pipeline or add dependencies unless the task explicitly asks for it.
- The environment update script is intentionally a no-op; the preinstalled
  Python 3 and Node.js toolchains are more than enough for working with these files.
- Editing tasks are normal text/Markdown edits. When editing a `.docx`, remember
  it is a ZIP archive of XML (`word/document.xml`), so `git diff` will not show
  meaningful changes for the binary files.
- To read `.docx` content without installing anything, use the Python standard
  library (no `python-docx` needed):

  ```python
  import zipfile
  from xml.etree import ElementTree as ET
  NS = '{http://schemas.openxmlformats.org/wordprocessingml/2006/main}'
  with zipfile.ZipFile("<file>.docx") as z:
      root = ET.fromstring(z.read("word/document.xml"))
  for p in root.iter(NS + 'p'):
      line = ''.join(t.text for t in p.iter(NS + 't') if t.text).strip()
      if line:
          print(line)
  ```

- If richer `.docx` conversion/rendering is ever needed, install `pandoc`
  (system package) on demand; it is not required for normal work here.
