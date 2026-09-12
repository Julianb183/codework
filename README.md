# codework

Cross-platform coding workspace launcher for macOS, Linux, and Windows.

It opens a project in VS Code, starts a terminal in that directory, and optionally opens Raycast AI on macOS or the configured AI URL on Windows/Linux.

## Usage

### macOS / Linux

```sh
./bin/codework [--all|-a] [--restart|-z] [project-directory]
```

### Windows PowerShell

```powershell
.\windows\codework.ps1 [-All] [-Restart] [-ProjectDirectory path]
```

`-a` / `--all` opens the AI workspace too. `-z` / `--restart` restarts the workspace applications first.

Set `CODEWORK_AI_URL` on Windows or Linux to open a browser AI workspace:

```sh
export CODEWORK_AI_URL='https://chatgpt.com/'
```

On macOS, the launcher opens Raycast; use its AI Chat command for a dedicated AI window.

## Install and PATH setup

Each platform installer copies the launcher and adds its install directory to the **user PATH** without requiring administrator access. PATH entries are added only once.

- macOS: `./macos/install.sh`
- Linux: `./linux/install.sh`
- Windows PowerShell: `.\windows\install.ps1`

Open a new terminal after installation so the updated PATH is loaded.
