return {
  "Goose97/timber.nvim",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  opts = {
    keymaps = {
      -- Set to false to disable the default keymap for specific actions
      -- insert_log_below = false,
      insert_log_below = "gpj",
      insert_log_above = "gpk",
      insert_plain_log_below = "gpo",
      insert_plain_log_above = "gp<S-o>",
      insert_batch_log = "gpb",
      add_log_targets_to_batch = "gpa",
      insert_log_below_operator = "g<S-p>j",
      insert_log_above_operator = "g<S-p>k",
      insert_batch_log_operator = "g<S-p>b",
      add_log_targets_to_batch_operator = "g<S-p>a",
    },
    log_marker = "🔵",
    -- Controls the flash highlight
    highlight = {
      -- After a log statement is inserted
      on_insert = true,
      -- After a log target is added to a batch
      on_add_to_batch = true,
      -- After a log entry is shown/jumped to in the summary panel
      on_summary_show_entry = true,
      -- The duration of the flash highlight
      duration = 500,
    },
    log_templates = {
      default = {
        -- Templates with auto_import: when inserting a log statement, the import line is inserted automatically
        -- Applies to batch log statements as well
        -- javascript = {
        --   [[logger.info('hello world')]],
        --   auto_import = [[const logger = require('pino')()]]
        -- }
        javascript = [[console.log("%log_target ==>", %log_target)]],
        typescript = [[console.log("%log_target ==>", %log_target)]],
        astro = [[console.log("%log_target ==>", %log_target)]],
        vue = [[console.log("%log_target ==>", %log_target)]],
        jsx = [[console.log("%log_target ==>", %log_target)]],
        tsx = [[console.log("%log_target ==>", %log_target)]],
        lua = [[print("%log_target ==>", %log_target)]],
        luau = [[print("%log_target ==>", %log_target)]],
        ruby = [[puts("%log_target #{%log_target}")]],
        elixir = [[IO.inspect(%log_target, label: "%log_target ==>")]],
        go = [[log.Printf("%log_target: %v\n", %log_target)]],
        rust = [[println!("%log_target: {:#?}", %log_target);]],
        python = [[print(f"{%log_target=}")]],
        c = [[printf("%log_target: %s\n", %log_target);]],
        cpp = [[std::cout << "%log_target: " << %log_target << std::endl;]],
        java = [[System.out.println("%log_target: " + %log_target);]],
        c_sharp = [[Console.WriteLine($"%log_target: {%log_target}");]],
        odin = [[fmt.printfln("%log_target: %v", %log_target)]],
        swift = [[print("%log_target:", %log_target)]],
        kotlin = [[println("%log_target: ${%log_target}")]],
      },
      plain = {
        javascript = [[console.log("%insert_cursor")]],
        typescript = [[console.log("%insert_cursor")]],
        astro = [[console.log("%insert_cursor")]],
        vue = [[console.log("%insert_cursor")]],
        jsx = [[console.log("%insert_cursor")]],
        tsx = [[console.log("%insert_cursor")]],
        lua = [[print("%insert_cursor")]],
        luau = [[print("%insert_cursor")]],
        ruby = [[puts("%insert_cursor")]],
        elixir = [[IO.puts(%insert_cursor)]],
        go = [[log.Printf("%insert_cursor")]],
        rust = [[println!("%insert_cursor");]],
        python = [[print(f"%insert_cursor")]],
        c = [[printf("%insert_cursor \n");]],
        cpp = [[std::cout << "%insert_cursor" << std::endl;]],
        java = [[System.out.println("%insert_cursor");]],
        c_sharp = [[Console.WriteLine("%insert_cursor");]],
        odin = [[fmt.println("%insert_cursor")]],
        swift = [[print("%insert_cursor")]],
        kotlin = [[println("%insert_cursor")]],
      },
    },
  },
}
