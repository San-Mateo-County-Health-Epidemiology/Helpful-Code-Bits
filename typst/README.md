
## Typst

“Typst is a new markup-based typesetting system for the sciences. It is
designed to be an alternative both to advanced tools like LaTeX and
simpler tools like Word and Google Docs. Our goal with Typst is to build
a typesetting tool that is highly capable and a pleasure to use.” -
[Typst site](https://typst.app/docs/).

There is some good documentation out there for Typst, but there isn’t a
ton about using Quarto with Typst. This is meant to supplement those
resources with code we find helpful.

## General things

Quarto Typst templates require two files:

- `typst-show.typ`: all of the elements that you want in your template
  need to be referenced in this document. If you add a custom parameter
  to your `typst-template.typ` and your Quarto yaml, you also need to
  include it here.
- `typst-template.typ`: this is where you specify how and where elements
  appear.

## Resources

[Repo](https://github.com/quarto-ext/typst-templates) of Quarto
templates built with typst
