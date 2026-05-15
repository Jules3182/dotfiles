#!/bin/bash

hyprctl eval 'hl.animation({ leaf = "workspacesIn", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" }) hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })'