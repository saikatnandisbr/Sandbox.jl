# imports
using InteractiveUtils   # in base Julia

# exports
export show_supertype_tree

# code
"""
    function show_superype_tree(leaf_type::Type)

Show supertype tree for given type.

leaf_tye:   Type for which supertype tree is to be displayed
"""

function show_supertype_tree(leaf_type::Type)

    level = 0       # level of tree
    indent = 4      # spaces used to indent each level of tree

    println(string(leaf_type))

    while leaf_type != Any

        leaf_type = supertype(leaf_type)
        level += 1

        println(join(fill(" ", level * indent)) * string(leaf_type))

    end
end
