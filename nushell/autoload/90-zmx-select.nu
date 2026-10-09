def zmx-select [] {
  let new = {name: "+ new session"}

  # Parse the zmx output
  let sessions = (
    zmx list
    | lines
    | parse -r 'name=(?<name>\S+)\s+pid=(?<pid>\S+)\s+clients=(?<clients>\S+)\s+created=(?<created>\S+)\s+cwd=(?<cwd>\S+)'
  )

  let choice = ($sessions | append $new | input list --fuzzy -d name "attach to: ")

  # Don't fail on no choice
  if $choice == null { return }

  # Creating a new session if needed
  let name = if $choice.name == $new.name { input "new session name: " } else { $choice.name }
  if ($name | is-empty) { return }

  zmx attach $"($name)"
}
