# imports
using InteractiveUtils   # in base Julia

# exports
export show_supertype_tree

# code
"""
    function superype_tree(leaf_type::Type)

Show supertype tree for given type.

leaf_tye:   Type for which supertype tree is to be displayed
"""

function supertype_tree(leaf_type::Type)

    level = 1                     # level of tree

    println(string(leaf_type))

    while leaf_type != Any

        leaf_type = supertype(leaf_type)

        # use global constant for indentation
        println(join(fill(" ", level * g_indent_spaces)) * string(leaf_type))
        
        level += 1

    end
end
