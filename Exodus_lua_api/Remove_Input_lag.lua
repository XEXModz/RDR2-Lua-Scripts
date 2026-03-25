---@diagnostic disable: lowercase-global
---@diagnostic disable: undefined-field
script.keep_alive()

menu.script_root():add_button("Remove Input Lag",{"Script will unload itself after finishing.","Saves the benchmark recording to:\n%USERPROFILE%\\Documents\\Rockstar Games\\Red Dead Redemption 2\\Benchmarks\nand submits some metrics."}, function()
    native.misc.save_end_user_benchmark()
    toast.add_info("Enjoy game without 'input lag'", "Thanks to Modder")
    thread.yield(5000)
    shutdown.script()
end)