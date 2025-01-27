
# stemkiosk/docs/conf.py
#
# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'stemkiosk'
copyright = '2025, @stemkiosk'
author = '@stemkiosk'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.todo',
    'sphinx.ext.mathjax',
    'sphinx.ext.intersphinx',
    'sphinx.ext.viewcode',
    'sphinx.ext.napoleon',
    #'myst_parser',
    'myst_nb',
    'sphinx_copybutton',
    #'sphinx_pyscript',
    #'jupyterlite_sphinx',
    'sphinxjp.themes.basicstrap',
    'wrd_sphinx_theme',
    'sphinxcontrib.srclinks',
    'sphinxcontrib.asciinema',
]

templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

source_suffix = {
    '.rst': 'restructuredtext',
    #'.txt': 'restructuredtext',
    #'.md': 'markdown',
    '.md': 'myst-nb',
    '.myst.md': 'myst-nb',
    '.myst': 'myst-nb',
    '.ipynb': 'myst-nb',
}
# MyST Markdown docs:
# - https://myst-nb.readthedocs.io/en/latest/authoring/basics.html#myst-markdown

master_doc = 'index'

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'sphinx_book_theme'
#html_theme = 'basic'
#html_theme = 'classic'
html_theme = 'wrd_sphinx_theme'
html_static_path = ['_static']
html_theme_options = {
    'icon_links': []
}


# sphinx-copybutton
copybutton_exclude = '.linenos, .gp, .go'
#copybutton_prompt_text = ">>> "
copybutton_prompt_text = r">>> |\.\.\. |\$ |In \[\d*\]: | {2,5}\.\.\.: | {5,8}: "
copybutton_prompt_is_regexp = True
copybutton_line_continuation_character = "\\"
copybutton_here_doc_delimiter = "EOF"


myst_enable_extensions = [
    "amsmath",
    "attrs_inline",
    "colon_fence",
    "deflist",
    "dollarmath",
    "fieldlist",
    "html_admonition",
    "html_image",
    "linkify",
    #"replacements",
    #"smartquotes",
    "strikethrough",
    "substitution",
    "tasklist",
]


sidebars_globaltoc = [
    'globaltoc.html',
    'relations.html',
    'searchbox.html',
    'srclinks.html',
    'links.html', ]

sidebars_localtoc = [
    'localtoc.html',
    'relations.html',
    'searchbox.html',
    'srclinks.html',
    'links.html', ]


sidebars_globallocaltoc = [
    'localtoc.html',
    'globaltoc.html',
    'relations.html',
    'searchbox.html',
    'srclinks.html',
    'links.html', ]
    #'globaltoc.html',

# Custom sidebar templates, maps document names to template names.
html_sidebars = {
    #'*': sidebars_globaltoc,
    '**': sidebars_globallocaltoc,
    # 'index': sidebars_globaltoc,
}



html_show_sourcelink = True


# srclink settings
srclink_project = 'https://github.com/westurner/stemkiosk'
#srclink_project = 'https://bitbucket.org/westurner/sphinxcontrib-srclinks'
#srclink_project = 'hg@bitbucket.org/westurner/sphinxcontrib-srclinks'
#srclink_project = 'git@bitbucket.org/westurner/sphinxcontrib-srclinks'
srclink_src_path = 'docs/'
#srclink_src_path = ''
srclink_branch = 'main'
#srclink_branch = 'develop'

