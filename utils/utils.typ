#let indice() = {
  pagebreak()

  show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    text(weight: "bold", it)
  }

  show outline.entry.where(level: 2): it => {
    text(weight: "regular", it)
  }

  outline(
    title: text(weight: "bold", size: 22pt)[Indice],
    depth: 7,
    indent: auto,
  )

  pagebreak()
}
#let indiceTabelle() = {
  show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    strong(it)
  }
  outline(title: [#v(2em) Indice delle Tabelle #v(2em)], indent: 1em, target: figure.where(kind: table))
}

/// Indicizza le immagini presenti nel documento
#let indiceImmagini() = {
  show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    strong(it)
  }
  outline(title: [#v(2em) Indice delle Immagini #v(2em)], indent: 1em, target: figure.where(kind: image))
}