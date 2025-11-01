# Windows specific config

# zellij through wsl (imperfect, detached sessions die)
def zellij [...args: string] {
  wsl -- SHELL=nu.exe /home/nathan/.cargo/bin/zellij (...$args)
}
