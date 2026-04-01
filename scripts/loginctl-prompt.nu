#!/usr/bin/env nu

def main [action: string] {
  zenity --question --title="Confirmation" --text $"Are you sure you want to ($action)?"

  loginctl $action
}
