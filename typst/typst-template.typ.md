# typst-template.typ
Beth Jump
2025-04-11

- [Overview](#overview)
- [Document defaults](#document-defaults)
- [Page settings](#page-settings)
  - [set page()](#set-page)
    - [header](#header)
    - [footer](#footer)
    - [background](#background)
  - [placing objects](#placing-objects)
  - [text](#text)
    - [headings](#headings)
    - [body](#body)

## Overview

The `typst-template.typ` is where most of the formatting is done for
your Quarto document. Some of the syntax is different here than it is in
the Typst examples and tutorials.

Broadly speaking the `typst-template.typ` has two parts:

1.  document defaults (`# let doc()`): here you set document defaults
    and reference parameters from the Quarto template YAML.  
2.  page settings (`= {...}` after `# let doc`): this is where you can
    specify page defaults, how elements appear and the general flow of
    elements in the document.

General outline of a template:

    # let doc(
        title: none,
        paper: "us-letter",
        ...
    ) = {

        set page(paper: paper,
                 header: context{...})
                 
        place(center + top,
              ...)
              
        linebreak()
        set text(...)
    }

## Document defaults

At the top of your `typst-template.typ`, you use the `# let` function to
specify document defaults. Parameters that are set to `: none` will be
pulled from the YAML of your Quarto template. Parameters with a value
can be referenced later on in the template.

If you want to add a custom value to your document, like `timeframe`,
you need to also add it to the Quarto YAML and the `typst-show.typ`.

    #let doc(
      title: none,
      author: none,
      timeframe: none,
      program: none,
      cols: 1,
      margin: (x: 0.5in,
               top: 1.15in,
               bottom: 1in),
      paper: "us-letter",
      font: "Arial",
      fontsize: 11pt,
      title_font: "Trade Gothic Next Rounded",
      doc,
    ) 

## Page settings

All of your custom configuration is done after the `# let doc`:

    # let doc( ) = {
        ...
        all custom configurations
        ...
    }

### set page()

The `set page()` function allows you to specify page defaults for
document. Anything you set within `set page()` doesn’t respect the page
margins. It is where you set the background of each page. Text and
inline elements are set after `set page()` and will respect margins and
the flow of text and document elements.

You can use the `background:` to set an element anywhere on the page
while `header:` and `footer:` are meant for elements at the top or
bottom.

#### header

`set page(header: ...)` is where you determine what appears in the
header of each page. You can place objects and specify positions with
`#place`. You can also use if else statements to have different elements
appear on different pages.

In this example, we have a logo in the top right corner of the first
page and have the title in size 16 font in the top right corner of
subsequent pages.

    set page(paper: paper,
             header: context {
             
             // page 1 of the report
             if counter(page).get().first() == 1 [
             // logo
                    #place(top + right,
                           dx: 0.3in,
                           dy: 0.3in,
                           image("images/logo.png",
                                width: 2.7in))
                                
                   ] else [

                    // title
                    #place(top + right,
                           dx: 0.3in,
                           dy: 0.3in,
                           block(width: 5in,
                                height: 0.25in,
                                inset: 0.1in)[
                             #text(size: 16pt,
                                   fill: rgb("000000"),
                                   font: title_font,
                                   top-edge: "cap-height",
                                   bottom-edge: "descender",
                                   align(right, title))])
                   ]})

#### footer

Like with the header, you can set elements in the page footer
dynamically or statically with `set page(header: ...)`.

    set page(footer: context [

                  // add department name ----
                  #place(bottom + left,
                          dx: -0.4in,
                          dy: -0.05in,
                          block(width: 5in,
                                height: 0.5in,
                                inset: 0.1in)[
                                    #text(weight: "bold",
                                          size: 14pt,
                                          fill: rgb("fefefe"),
                                          font: title_font,
                                          top-edge: "cap-height",
                                          bottom-edge: "descender")[#department]])

                   // add page counter. First specify text and then specify placement ----
                   #set text(size: 11pt,
                             fill: rgb("fefefe"),
                             font: title_font,
                             top-edge: "cap-height",
                             bottom-edge: "descender")
                   #place(bottom + right,
                          dx: 0in,
                          dy: -0.18in,
                          counter(page).display("1 of 1", both: true))

                    ])

#### background

You can use the same functions for `background:` as you can for
`header:` and `footer:`. Here we place a teal colored bar horizontally
across the first page of our document. The bar will start 0.95 inches
from the top, will be 0.1 inches tall and will span the whole page:

    set page(background: context {
                if counter(page).get().first() > 1 [

                       #place(center + top,
                              dx: 0in,
                              dy: 0.95in,
                              rect(width: 8.5in,
                                   height: 0.1in,
                                   fill: rgb("38939b")))

               ]})

### placing objects

### text

#### headings

#### body
