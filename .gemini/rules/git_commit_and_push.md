# DhakaLife Git Commit & Push Rule

This rule applies to all agents and developers working on the **DhakaLife** project (`d:\projects\AIS_NU`).

## Repository Specification
- **Remote URL**: `https://github.com/mridulhaze/DhakaLife`
- **Default Branch**: `main`

## Mandatory Workflow
1. **Meaningful Commit Messages**:
   - Every modification, feature addition, UI overhaul, bug fix, or documentation update must be committed with a clear, meaningful message.
   - Use conventional commit prefixes:
     - `feat:` for new screens, services, or features.
     - `fix:` for bug fixes, crash corrections, or layout adjustments.
     - `refactor:` for code cleanups, optimization, or architecture improvements.
     - `docs:` for updates to README, PROJECT_CONTEXT, or architectural specifications.
     - `style:` for UI styling, fonts, or assets.
2. **Commit Status & Content**:
   - Do NOT combine unrelated changes into generic messages like "update" or "changes".
   - Include a concise title and bullet points detailing the changes made.
3. **Always Push to Remote**:
   - Whenever a feature or task is completed, verify git status and push to `origin main`:
     ```bash
     git push origin main
     ```
4. **Clean Working Tree**:
   - Ensure build artifacts (`build/`, `*.apk`, `.dart_tool/`) remain ignored via `.gitignore` and are never committed.
