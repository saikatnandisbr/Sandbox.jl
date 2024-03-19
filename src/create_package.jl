"""
    function create_package(pkg_name::String)

Create package using PkgTemplates
"""

using PkgTemplates

function create_package(pkg_name::String)

    t = Template(;
        user="saikatnandisbr",
        authors=["Saikat Nandi"],
        plugins=[
            License(name="MIT"),
            Git(),
            GitHubActions(),
        ],
    )

    t(pkg_name)
end
