def qc [...query: string] {
  let prompt = ($"I want to achieve the following with a command: ($query | str join ' ')."
    + " Respond with only the command, as I will execute your response verbatim in my terminal. I am using nushell."
    + " Do not include any markup of any kind, including markdown, in the answer, only the command."
    + " Answer ONLY with the final command, do not tell me what you are thinking, only answer with the final command I can run in my shell.")

  let suggestion = (claude -p $prompt)
  print ($"($suggestion) (ansi red) \(enter/\(c\)opy/esc\)(ansi reset)")

  let key = (input listen --raw)

  mut copy_cmd = 'wl-copy'
  if (sys host | get long_os_version | str contains -i macos) {
    $copy_cmd = 'pbcopy'
  }

  match $key.code {
    'enter' => {nu -c $suggestion}
    'c' | 'C' => {echo $suggestion | str trim | ^$copy_cmd} 
  }
}
