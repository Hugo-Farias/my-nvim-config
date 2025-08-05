return {
  "chrisgrieser/nvim-spider",
  lazy = true,
  opts = {
    InsignificantPunctuation = true,
    consistentOperatorPending = false, -- see the README for details
    subwordMovement = false,
    customPatterns = {}, -- see the README for details
  },
  keys = {
    { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
    { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
    { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
  },
}
