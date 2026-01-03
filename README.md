# react-vite-starter

A small collection of POSIX shell utilities to quickly scaffold a React + Vite + TypeScript
starter project and to create feature folders using an opinionated, feature-first architecture.

## Overview

- `bin/react-starter` — Interactive script that bootstraps a Vite React + TypeScript project,
	installs a set of commonly-used packages, initializes Tailwind CSS, and scaffolds an
	opinionated `src/` layout.
- `bin/react-feature` — Interactive helper to create a new feature folder under
	`src/features/<feature-name>` with `api/`, `model/`, and `ui/` subfolders and base files.
- `install.sh` — Installs the scripts to `/usr/local/bin` so they can be run globally.

This repo is useful when you want a fast, repeatable way to create new React projects
that follow a feature-first structure.

## Requirements

- Node.js and npm available on your PATH.
- Optional: `sudo` privileges if you plan to run `install.sh` to install scripts globally.

## Quick start — run locally (no install)

From this repository run the starter script directly:

```bash
./bin/react-starter
```

Follow the interactive prompts (project name, etc.). After the script finishes:

```bash
cd <project-name>
npm run dev
```

## Install scripts globally

To make `react-starter` and `react-feature` available system-wide:

```bash
./install.sh
# or, if needed:
sudo ./install.sh
```

Then run:

```bash
react-starter
react-feature
```

## Typical workflow

1. Scaffold a new project:

```bash
react-starter
```

2. Inside your new project, add features as you build:

```bash
# from project root (requires src/features to exist)
react-feature
# follow the prompt (use kebab-case names)
```

## Project architecture

See [arch.txt](arch.txt) for the full diagram. Example layout:

- `src/`
	- `app/` — bootstrap (providers, router, store)
	- `shared/` — reusable UI components, hooks, libraries, constants
	- `features/` — feature folders (each with `api/`, `model/`, `ui/`)
	- `pages/` — page assemblies (Dashboard, Login, etc.)
	- `main.tsx`, `assets/`

## What the scripts do

- `bin/react-starter`:
	- Runs `npm create vite@latest` with the `react-ts` template.
	- Installs a set of packages (Tailwind, router, axios, icons, date helpers, etc.).
	- Runs `npx tailwindcss init -p` to add Tailwind config and PostCSS.
	- Creates the feature-first directory layout and moves `App.tsx` to `src/app`.

- `bin/react-feature`:
	- Creates `src/features/<feature-name>/` with `api/`, `model/`, and `ui/` folders
		and adds base files such as `index.ts`, `<feature>.api.ts`, and `<feature>.types.ts`.
	- Fails early if the target feature already exists (prevents accidental overwrite).

## Customization

- Edit the scripts in the `bin/` directory to change the installed packages,
	scaffolded files, or folder layout.
- Modify `install.sh` to change the install destination or behavior.

## Safety notes

- Scripts use `set -euo pipefail` and include basic precondition checks, but review them
	before running on important machines.
- The starter installs several packages by default — review and adjust to match your
	policies and preferences.

## Contributing

Improvements, bug fixes, and additional templates are welcome. Open an issue or PR
with a short description and any example or tests when relevant.

## License

MIT — feel free to reuse and adapt these scripts.
