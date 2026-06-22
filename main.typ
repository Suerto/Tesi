#import "utils/utils.typ" : * 

#set text(font: "New Computer Modern", size: 11pt, lang: "it")
#set par(justify: true, leading: 1.05em)
#set page(paper: "a4", margin: (x: 2.2cm, y: 2.2cm))

#align(center)[
  #text(size: 22pt, weight: "bold")[Università degli Studi di Padova] \
  #v(0.3em)
  #text(size: 15pt)[DIPARTIMENTO DI MATEMATICA \"TULLIO-LEVI CIVITA\"] \
  #v(0.2em)
  #text(size: 12pt)[CORSO DI LAUREA IN INFORMATICA]

  #v(1cm)
  #image("images/unipd.png", width: 50%)
  #v(1cm)

  #text(size: 22pt, weight: "bold")[Kargo: Applicazione Web per la Logistica dello Scarico Merci] \
  #v(0.4cm)
  #text(size: 15pt)[_Tesi di Laurea_]
]

#v(2fr)

#grid(
  columns: (1fr, 1fr),
  align(left)[
    _Relatore_ \
    Tullio Vardanega
  ],
  align(right)[
    _Laureando_ \
    Suar Alberto
  ]
)

#v(2cm)

// Linea separatrice e Anno Accademico
#align(center)[
  #line(length: 100%, stroke: 0.5pt)
  #v(0.5em)
  ANNO ACCADEMICO 2025 - 2026
]

#pagebreak()
#v(1fr) // Spinge il contenuto successivo verso il basso

#align(center)[
  #text(size: 9pt)[
    © Suar Alberto, Luglio 2026. Tutti i diritti riservati. \
    Tesi di Laurea Triennale: *\"Kargo: Applicazione Web per la Logistica dello Scarico Merci\"*, \
    Università degli Studi di Padova, Dipartimento di Matematica “Tullio Levi-Civita”, \
    Corso di Laurea in Informatica.
  ]
]

#pagebreak()
#indice()

#indiceImmagini()

#pagebreak()

#indiceTabelle()

#pagebreak()