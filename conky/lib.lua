function conky_dualsense()
  local raw_out = conky_parse("${exec $HOME/.local/bin/dualsensectl battery}")
  if #raw_out > 0 then
    return conky_parse("${color0}DualSense Battery:$color ${exec nu -c '^$\"($env.HOME)/.local/bin/dualsensectl\" battery | split words | get 0'}% ${execbar nu -c '/home/nathan/.local/bin/dualsensectl battery | split words | get 0'}$hr")
  else
    return conky_parse("${color0}DualSense Battery:$color Not Connected")
  end
end
