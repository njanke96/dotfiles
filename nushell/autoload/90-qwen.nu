def qq [...query: string] {
  # start ollama serve if needed
  let pid = (pgrep -f 'ollama serve' | complete | get stdout)

  if not ($pid | str length | into bool) {
    job spawn { ollama serve }
    # give it a chance to start
    sleep 3sec
  }

  let prompt = (" Respond with only the command, as I will execute your response verbatim in my terminal. I am using nushell."
    + " Do not include any markup of any kind, including markdown, in the answer, only the command."
    + " Answer ONLY with the final command, do not tell me what you are thinking, only answer with the final command I can run in my shell."
    + " Once again, I am using nushell, not a posix shell."
    + $" I want to achieve the following with a shell command: ($query | str join ' ').")

  let suggestion = (ollama run qwen3-coder:30b $prompt)
  print ($"($suggestion) (ansi red) \(enter/\(c\)opy/esc\)(ansi reset)")

  let key = (input listen --types [key])

  mut copy_cmd = 'wl-copy'
  if (sys host | get long_os_version | str contains -i macos) {
    $copy_cmd = 'pbcopy'
  }

  match $key.code {
    'enter' => {nu -c $suggestion}
    'c' | 'C' => {echo $suggestion | str trim | ^$copy_cmd} 
  }
}
