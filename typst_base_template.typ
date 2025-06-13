#let horizontalrule = line(start: (25%,0%), end: (75%,0%))

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

#set table(
  inset: 6pt,
  stroke: none
)

#show figure.where(
  kind: table
): set figure.caption(position: $if(table-caption-position)$$table-caption-position$$else$top$endif$)

#show figure.where(
  kind: image
): set figure.caption(position: $if(figure-caption-position)$$figure-caption-position$$else$bottom$endif$)

#set par(
  spacing: 1.2em, // Adjust this for space between paragraphs
  first-line-indent: 0pt // Set to 0pt if you only want space between paragraphs, no indentation
)

#show heading.where(
  level: 1
): set block(
  above: 3em, // Space above the heading
  below: 1.5em, // Space below the heading
)

#show heading.where(
  level: 2
): set block(
  above: 3em, // Space above the heading
  below: 1.5em, // Space below the heading
)

#show heading.where(
  level: 3
): set block(
  above: 3em, // Space above the heading
  below: 1.2em, // Space below the heading
)

#set list(spacing: 0.6em)
#set enum(spacing: 0.6em)

#show raw: set block(
  fill: luma(240), // A light gray color (0 = black, 255 = white)
  inset: 10pt,   // Padding around the code
  radius: 0pt,     // Slightly rounded corners (optional)
  width: 100%      // Ensure the box takes full available width
)

#show math.equation: set block(
  breakable: true,
  above: 2em,
  below: 2em
)

$if(template)$
#import "$template$": conf
$else$
$template.typst()$
$endif$

$if(smart)$
$else$
#set smartquote(enabled: false)

$endif$
$for(header-includes)$
$header-includes$

$endfor$
#show: doc => conf(
$if(title)$
  title: [$title$],
$endif$
$if(subtitle)$
  subtitle: [$subtitle$],
$endif$
$if(author)$
  authors: (
$for(author)$
$if(author.name)$
    ( name: [$author.name$],
      affiliation: [$author.affiliation$],
      email: [$author.email$] ),
$else$
    ( name: [$author$],
      affiliation: "",
      email: "" ),
$endif$
$endfor$
    ),
$endif$
$if(keywords)$
  keywords: ($for(keywords)$$keyword$$sep$,$endfor$),
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(lang)$
  lang: "$lang$",
$endif$
$if(region)$
  region: "$region$",
$endif$
$if(abstract)$
  abstract: [$abstract$],
$endif$
$if(margin)$
  margin: ($for(margin/pairs)$$margin.key$: $margin.value$,$endfor$),
$endif$
$if(papersize)$
  paper: "$papersize$",
$endif$
$if(mainfont)$
  font: ("$mainfont$",),
$endif$
$if(fontsize)$
  fontsize: $fontsize$,
$endif$
$if(section-numbering)$
  sectionnumbering: "$section-numbering$",
$endif$
  pagenumbering: $if(page-numbering)$"$page-numbering$"$else$none$endif$,
  cols: $if(columns)$$columns$$else$1$endif$,
  doc,
)

$for(include-before)$
$include-before$

$endfor$
$if(toc)$
#place(
  left + bottom,
  float: true,
  outline(
    title: "Table of Contents",
    depth: $toc-depth$,
  )
)
$endif$

$body$

$if(citations)$
$if(csl)$

#set bibliography(style: "$csl$")
$elseif(bibliographystyle)$

#set bibliography(style: "$bibliographystyle$")
$endif$
$if(bibliography)$

#bibliography($for(bibliography)$"$bibliography$"$sep$,$endfor$)
$endif$
$endif$
$for(include-after)$

$include-after$
$endfor$