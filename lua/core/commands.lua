local function GoRunCMD()
  print(" Go command Run  ==>" )
  vim.cmd("!go run ./...")
end
return {
  GoRunCMD = GoRunCMD
}
