# imports
using PkgTemplates

# exports
export create_package

# code
"""
    function create_package(pkg_name::String)

Create package using PkgTemplates. 
After creating package using this function follow the steps below to upload the package to github:

    1. Create repo on github with name <pkg_anme>.jl

    2. Upload local changes using following git commands as necessary

        git remote -v                                            # url shall include .git at end
        git remote set-url origin <https URL with .git at end>   # if necessary run this command to update origin url
        git remote -v                                            # url shall include .git at end
        git push -u origin main
"""

function create_package(pkg_name::String)

    template = Template(;
        user="saikatnandisbr",
        authors=["Saikat Nandi"],
        plugins=[
            License(name="MIT"),
            Git(),
            !GitHubActions,   # may be later
            !CompatHelper,    # may be later
            !TagBot           # may be later
        ],
    )

    template(pkg_name)
end
