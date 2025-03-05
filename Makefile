# Do everything.
all: init link defaults brew setup vscode other_apps

# Set initial preference.
init:
	@chmod +x .bin/init.sh
	@echo "\033[0;34mRun init.sh\033[0m"
	@.bin/init.sh
	@echo "\033[0;34mDone.\033[0m"

# Link dotfiles.
link:
	@chmod +x .bin/link.sh
	@echo "\033[0;34mRun link.sh\033[0m"
	@.bin/link.sh
	@echo "\033[0;32mDone.\033[0m"

# Set macOS system preferences.
defaults:
	@chmod +x .bin/defaults.sh
	@echo "\033[0;34mRun defaults.sh\033[0m"
	@.bin/defaults.sh
	@echo "\033[0;32mDone.\033[0m"

# Install macOS applications.
brew:
	@chmod +x .bin/brew.sh
	@echo "\033[0;34mRun brew.sh\033[0m"
	@.bin/brew.sh
	@echo "\033[0;32mDone.\033[0m"

# Setup tools.
setup:
	@chmod +x .bin/setup.sh
	@echo "\033[0;34mRun setup.sh\033[0m"
	@.bin/setup.sh
	@echo "\033[0;32mDone.\033[0m"

# Setup Visual Studio Code
vscode:
	@chmod +x .vscode/vscode.sh
	@echo "\033[0;34mRun vscode.sh\033[0m"
	@.vscode/vscode.sh
	@echo "\033[0;32mDone.\033[0m"

# Setup Other apps
other_apps:
	@chmod +x .bin/other_apps.sh
	@echo "\033[0;34mRun other_apps.sh\033[0m"
	@.bin/other_apps.sh
	@echo "\033[0;32mDone.\033[0m"