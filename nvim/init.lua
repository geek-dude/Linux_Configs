require ("keymaps")
require ("options")
require ("lazy").setup('plugins',
    {
        checker = 
        {
            -- automatically check for plugin updates
            enabled = true,
            concurrency = 1, ---@type number? set to 1 to check for updates very slowly
            notify = true, -- get a notification when new updates are found
            frequency = 43200, -- check for updates every 12 hours
            check_pinned = true, -- check for pinned packages that can't be updated
        },
    }
)
