#let tags(
  class: "6.100",
  title: "LP1",
  authors: none,
  date: datetime.today(),
  version: none,
  deadline: none,
  subproblems: "1.1.a.i",
  doc
) = {[
/* Convert authors to a string if necessary */
#let authors=if type(authors) == array {authors.join(", ")} else {authors}

/* Problem + subproblem headings */
#set heading(numbering: (..nums) => {
    nums = nums.pos()
    if nums.len() == 1 {
      [#nums.at(0):]
    } else {
      numbering(subproblems, ..nums)
    }
})


/* Set metadata */
#set document(
  title: [#class - #title],
  author: authors,
  date: date,
)

#show "var.deadline": deadline

/* Set up page numbering and continued page headers */
#set page(
  numbering: "1",
  header: context {
  if counter(page).get().first() > 1 [
    #set text(style: "italic")
    #class -- #title
    #h(1fr)
    #if authors != none {[#authors]}
    #block(line(length: 100%, stroke: 0.5pt), above: 0.6em)
  ]
})

/* Add numbering and some color to code blocks */
#show raw.where(block: true): it => {
  block[
    #h(1fr)
    #box(
      width: 100%-0.5em,
      radius: 0.3em,
      stroke: luma(50%),
      inset: 1em,
      fill: if it.lang != none { luma(98%) } else { black }
    )[
        #show raw.line: l => context {
          box(width: measure([#it.lines.last().count]).width, if it.lang != none {
            align(right, text(fill: luma(50%))[#l.number])})
          if it.lang != none { h(0.5em) }
          l.body
        }
      #set text(fill: if it.lang != none { black } else { white })
      #it
    ]
  ]
}

/* Make the title */
#align(left, {
  image("logo_lusofona.png", width: 15%)})
#align(center, {
  text(size: 1.6em, weight: "bold")[#class -- #title \ ]
  text(size: 1em, weight: "semibold")[#authors \ ]
  emph[
    #if deadline != none {[Deadline: #deadline]}
    #h(1fr)
    #date.display("[day]-[month]-[year]")
    #if version != none {[v#version]}
  ]
  box(line(length: 100%, stroke: 1pt))
  v(10pt)
})

#doc
]}
