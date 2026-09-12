CODEWORK AND REST
=================

This repository contains codework, a cross-platform coding workspace launcher,
and rest, a cross-platform sleep command.

CODEWORK
--------
Codework opens Visual Studio Code, a terminal in the selected project folder,
and an optional AI workspace.

macOS / Linux:
  codework [--all|-a] [--restart|-z] [project-directory]

Windows PowerShell:
  .\codework.ps1 [-All] [-Restart] [-ProjectDirectory path]

Use -a/--all to open the AI workspace. Use -z/--restart to restart workspace
applications before opening them. If no project directory is supplied, the
current directory is used.

REST
----
Rest puts the computer to sleep. The macOS version uses the existing native
rest-screen animation when that executable is installed, then uses pmset as a
fallback. Linux uses systemctl suspend. Windows uses the PowerShell sleep
API. Press Ctrl+C during the short cancellation window where supported.

macOS / Linux:
  rest
  rest -a

Windows PowerShell:
  powershell -ExecutionPolicy Bypass -File "$HOME\codework\rest.ps1"

The -a option is preserved on macOS for the existing rest-screen --all mode.
On Linux and Windows it is accepted for command compatibility.

INSTALLATION AND PATH
---------------------
Each installer adds its user-level install directory to PATH without requiring
administrator access. PATH entries are not duplicated.

macOS:
  cd rest
  ./install-macos.sh

Linux:
  cd rest
  ./install-linux.sh

Windows PowerShell:
  Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
  .\rest\install-windows.ps1

Open a new terminal after installing so PATH changes are loaded.

AI CONFIGURATION
----------------
On Linux and Windows, set CODEWORK_AI_URL to an AI page before using codework
-a. macOS opens Raycast for its AI workspace.

ZIP PACKAGES
------------
The dist directory contains codework-macos.zip, codework-linux.zip, and
codework-windows.zip. Each package contains the codework port, rest port,
installer scripts, and this documentation.
