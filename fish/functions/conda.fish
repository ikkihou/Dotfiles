# function conda --wraps 'conda'
#     echo 'Initializing conda...'
#     # We erase ourselves because conda defines a function of the same name.
#     # This allows checking that that happened and can prevent infinite loops
#     functions --erase conda
#     /Users/baoyihui/miniconda3/bin/conda "shell.fish" "hook" | source
#
#     if not functions -q conda
#         # If the function wasn't defined, we should not do the call below.
#         echo 'Something went wrong initializing conda!' >&2
#         return 1
#     end
#     
#     # Now we can call `conda`, which is a function, but not this one (because we erased it),
#     # so this is not an infinite loop.
#     conda $argv
# end

source "/Users/baoyihui/miniconda3/etc/fish/conf.d/conda.fish"
