def omp-init [] {
  let cmd = "oh-my-posh init nu --config ~/.theme.omp.json"
  print $cmd
  nu -c $"($cmd)"
}
