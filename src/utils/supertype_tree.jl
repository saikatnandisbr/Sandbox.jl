# imports
using InteractiveUtils   # in base Julia

# exports
export supertype_tree

# code
"""
    function supertype_tree(leaf_type::Type; indent=g_indent_spaces)

Show supertype tree for given type.

leaf_tye:   Type for which supertype tree is to be displayed
indent:     Indent spaces keyword argument supplied with default of global constant
"""

function supertype_tree(leaf_type::Type; indent=g_indent_spaces)

    level = 0                     # level of tree

    # define closure function that utilizes values of level and indent variables from calling environment
    # in effect, each time formatter is invoked it returns an anonymous function that uses these two variables
    formatter = type -> join(fill(" ", level * indent)) * string(type) * "$(isabstracttype(type) ? " (Abstract)" : " (Concrete)")"

    println(formatter(leaf_type))

    while leaf_type != Any

        level += 1

        leaf_type = supertype(leaf_type)

        println(formatter(leaf_type))
        
    end
end
