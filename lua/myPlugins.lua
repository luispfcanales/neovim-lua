local function GoRun()
  print(" Go command Run  ==>" )
  vim.cmd("!go run .")
end
return {
  GoRun = GoRun
}
