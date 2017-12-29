# Glossary

In order to create a new glossary term, create the file in this directory with .md extension, e.g. `foo-bar.md`, and insert the following front matter

    ---
    title: Foo Bar
    ---
    
    ## Foo Bar
    
    A foo bar is ...

To link to a glossary term use this syntax:

    [Foo Bars](glossary/foo-bar.html){:.glossary}

This adds the `glossary` class, allowing us to style it as a glossary link.  (Within a glossary, you can link to others without the `glossary/` directory, of course.)
