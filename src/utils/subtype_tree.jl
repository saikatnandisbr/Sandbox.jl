# imports
using InteractiveUtils   # in base Julia

# exports
export subtype_tree

# code

# let block to hide internals
let
    
"""
    function subtype_tree(root_type::Type)

Show subtype tree for given type.

root_tye:   Type for which subtype tree is to be displayed
"""

global function subtype_tree(root_type::Type)

    # print root type
    formatted = string(root_type) * "$(isabstracttype(root_type) ? " (Abstract)" : " (Concrete)")"
    println(formatted)

    # call function to show nested tree
    # use global constant for indentation
    subtype_tree_nested(root_type, 1, g_indent_spaces)
end

"""
    function subtype_tree_nested(root_type::Type, level::Int, indent::Int)

Show subtype tree for given type.

root_tye:   Type for which subtype tree is to be displayed
level:      Current level in tree
indent:     Number of spaces used to indent each level
"""

function subtype_tree_nested(root_type::Type, level::Int, indent::Int)

    for sub_type in subtypes(root_type)
        # print each substype with same indent
        formatted = join(fill(" ", level * indent)) * string(sub_type) * "$(isabstracttype(sub_type) ? " (Abstract)" : " (Concrete)")"
        println(formatted)

        # recursively display subtypes of type with increased indent
        subtype_tree_nested(sub_type, level+1, indent)
    end
end    

end # let
