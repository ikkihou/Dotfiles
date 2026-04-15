# Project Overview

This is a configuration for SketchyBar, a highly customizable macOS status bar replacement. The configuration is written primarily in Lua, with helper scripts in shell and C for providing data to the bar.

The configuration is structured as follows:

- `sketchybarrc`: The main entry point, which is a Lua script that loads the rest of the configuration.
- `init.lua`: Initializes the bar and loads the different components.
- `bar.lua`: Configures the main bar's appearance (height, color, etc.).
- `colors.lua`: Defines the color palette used throughout the configuration.
- `icons.lua`: Defines the icons used for different items.
- `items/`: Contains the configuration for the individual items on the bar.
  - `items/init.lua`: Loads all the items.
  - `items/widgets/`: Contains the configuration for the widgets (e.g., CPU, WiFi, battery).
- `plugins/`: Contains shell scripts that are run periodically to update the bar.
- `helpers/`: Contains helper scripts and C code for providing data to the bar.
  - `helpers/event_providers/`: Contains C code for long-running processes that provide data via events.

## Building and Running

This project doesn't have a traditional build process. To use this configuration, you need to have SketchyBar installed. Then, you can either symlink or copy the contents of this directory to `~/.config/sketchybar/`.

SketchyBar will automatically pick up the configuration from the `sketchybarrc` file.

The C code in `helpers/event_providers/` needs to be compiled. There are Makefiles in the respective directories that can be used for this purpose. For example, to compile the `cpu_load` event provider:

```sh
cd helpers/event_providers/cpu_load
make
```

## Development Conventions

The configuration is written in Lua and follows a modular structure. Each item on the bar has its own file in the `items/` directory.

There are two main ways to update the bar:

1.  **Event Providers (C code):** For data that needs to be updated frequently (e.g., CPU load), a long-running C process is used to provide data via events. The Lua configuration then subscribes to these events and updates the bar accordingly. This is more efficient than running a new process every few seconds.
2.  **Plugins (Shell scripts):** For data that doesn't need to be updated as frequently (e.g., battery status), a shell script is run periodically. The script then uses the `sketchybar` command-line tool to update the bar.
