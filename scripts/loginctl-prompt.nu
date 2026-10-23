#!/usr/bin/env nu

def main [action: string] {
  ~/scripts/rofi-yn.sh $"Are you sure you want to ($action)?"

  loginctl $action
}
