#!/bin/bash

# Sets animation to go bottom up
hyprctl eval 'hl.animation({ leaf = "specialWorkspaceIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefadevert" })'
hyprctl eval 'hl.animation({ leaf = "specialWorkspaceOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefadevert" })'

# Opens the system stats special workspace
hyprctl eval 'hl.dispatch(hl.dsp.workspace.toggle_special("sysstats"))'

# Sets them back to normal

hyprctl eval 'hl.animation({ leaf = "specialWorkspaceIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefadevert -50%" })'
hyprctl eval 'hl.animation({ leaf = "specialWorkspaceOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefadevert -50%" })'