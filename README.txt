CODEWORK
========

A cross-platform coding workspace launcher for macOS, Linux, and Windows.

WHAT IT DOES
-------------
Codework opens the tools needed for a coding session in one step:

- Visual Studio Code with the selected project folder
- A terminal already working in that project folder
- An AI workspace when requested

SUPPORTED PLATFORMS
-------------------
macOS:
  Opens VS Code, Terminal, and Raycast. Raycast AI Chat can then be opened
  from Raycast.

Linux:
  Opens VS Code and the first supported terminal it finds: GNOME Terminal,
  Konsole, Kitty, Alacritty, or x-terminal-emulator. If CODEWORK_AI_URL is
  set, the AI page opens in the default browser.

Windows:
  Opens VS Code and Windows Terminal, or PowerShell if Windows Terminal is
  unavailable. If CODEWORK_AI_URL is set, that AI page opens in the browser;
  otherwise ChatGPT opens.

COMMANDS
--------
macOS and Linux:
  codework [--all|-a] [--restart|-z] [project-directory]

Windows PowerShell:
  .\codework.ps1 [-All] [-Restart] [-ProjectDirectory path]

Examples:
  codework -a ~/Projects/MyApp
  codework -z ~/Projects/MyApp
  .\codework.ps1 -All -ProjectDirectory C:\Projects\MyApp

OPTIONS
-------
-a, --all
  Open the AI workspace along with VS Code and the terminal.

-z, --restart
  Close and reopen the workspace applications, then open the workspace.

project-directory
  The folder to open. If omitted, the current directory is used.

INSTALLATION AND AUTOMATIC PATH SETUP
-------------------------------------
Each platform has an installer that copies the launcher and adds its install
location to the current user's PATH. The PATH entry is added only once and
administrator access is not required.

macOS:
  cd macos
  ./install.sh

Linux:
  cd linux
  ./install.sh

Windows PowerShell:
  Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
  .\windows\install.ps1

Open a new terminal after installation so the updated PATH is loaded.

AI URL CONFIGURATION
--------------------
On Linux or Windows, set CODEWORK_AI_URL to an AI service before using -a:

  macOS/Linux:
    export CODEWORK_AI_URL='https://chatgpt.com/'

  Windows PowerShell:
    $env:CODEWORK_AI_URL = 'https://chatgpt.com/'

macOS opens Raycast for the AI workspace instead of using CODEWORK_AI_URL.

ZIP PACKAGES
------------
The dist directory contains separate packages:

  codework-macos.zip
  codework-linux.zip
  codework-windows.zip

Each package includes the launcher, documentation, and the installer for its
platform.

HOW IT WORKS
------------
1. The launcher parses the project path and options.
2. It resolves the path to an absolute directory.
3. With -z, it closes the supported workspace applications and waits briefly.
4. It starts VS Code with the project directory.
5. It starts a supported terminal in the same directory.
6. With -a or -z, it opens the configured AI workspace.

The launcher does not modify project files. Installers only copy codework and
update the current user's PATH.
