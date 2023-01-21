import os
import sys

sys.path.insert(0, os.path.abspath("../.."))

project = "Sample Docs"
copyright = "2022, Aleksandr Artemenkov"
author = "Aleksandr Artemenkov"
release = "0.0.1"

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    "sphinx.ext.autodoc",
    "sphinx.ext.viewcode",
    "sphinx.ext.napoleon",
    "nbsphinx",
]

templates_path = ["_templates"]
exclude_patterns = ["Thumbs.db", ".DS_Store", "sample_docs/docs/*"]

add_function_parentheses = True
add_module_names = False

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = "alabaster"
html_static_path = ["_static"]
# Just render the notebooks, do not execute anything
nbsphinx_execute = "never"
