# imports
using InteractiveUtils   # in base Julia

# exports
export show_subtype_tree

# code
"""
    show_subtype_tree(root_type::Type)

Show subtype tree for given type.

root_tye:   Type for which subtype tree is to be displayed
"""

function show_subtype_tree(root_type::Type)
    # call function to show nested tree
    show_subtype_tree_nested(root_type, 1, 4)
end

"""
    show_subtype_tree_nested(root_type::Type, level::Int, indent::Int)

Show subtype tree for given type.

root_tye:   Type for which subtype tree is to be displayed
level:      Current level in tree
indent:     Number of spaces used to indent each level
"""

function show_subtype_tree_nested(root_type::Type, level::Int, indent::Int)

    # print root type without indent
    if level == 1 println(root_type) end

    for sub_type in subtypes(root_type)
        # print each substype with same indent
        println(join(fill(" ", level * indent)) * string(sub_type))

        # recursively display subtypes of type with increased indent
        show_subtype_tree_nested(sub_type, level+1, indent)
    end
end