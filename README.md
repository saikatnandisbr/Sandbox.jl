# Sandbox
Sandbox module along with its associated environment is created to prvoide a place where various functional modules can be combined into a solution and to test that solution. This environement is also the place to carry out initial exploratory work before putting respective code in appropriate functional modules using design best practices.

Essentially, Sanbox is a substitute for Main environment. In Julia by default any packages installed in Main are available to modules. This can create inadvertent dependencies on packages in Main. In setting up Sandbox, Main environment is kept empty of all packages. This avoids inadvertent dependencies.

Sandbox is the place for exploratory analysis and code testing. Once the code features and their implementations are somewhat crystalized the corresponding code is moved to appropriate functional modules following design best practices. These include SOLID, and other principles of simplification, least astonishment, lest privilege, and minimalist implementation.

SOLID principles:

    Single Purpose

    Open/Close

    Liskov Substitution

    Interface Demarcation

    Dependency Inversion
