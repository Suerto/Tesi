#let primary = rgb("#1A365D") 
#let accent  = rgb("#F59E0B") 
#let text-color = rgb("#333333") 

#let conf(doc) = {
  set document(title: "Presentazione Tesi - Kargo", author: "Suar Alberto")
  
  set page(
    paper: "presentation-16-9",
    margin: (top: 5em, bottom: 3em, left: 3em, right: 3em),
    footer: context {
      let current = counter(page).get().first()
      let total = counter(page).final().first()
      
      set text(size: 12pt, fill: primary.lighten(30%))
      grid(
        columns: (1fr, auto, 1fr),
        align(left)[Suar Alberto],
        align(center)[Kargo: Logistica Scarico Merci],
        align(right)[#current di #total]
      )
    }
  )

  set text(font: "New Computer Modern", size: 20pt, fill: text-color)
  set list(marker: text(fill: accent)[•])
  
  doc
}

#let title-slide(title: "", author: "", date: "") = {
  page(
    header: none,
    footer: none,
    margin: (top: 2em, bottom: 2em, left: 2em, right: 2em)
  )[
    // IN ALTO: Testi a sinistra e logo a destra sulla stessa linea
    #grid(
      columns: (1fr, auto),
      align(left)[
        #text(size: 14pt, fill: primary, weight: "bold")[
          Università degli Studi di Padova \
          Dipartimento di Matematica "Tullio Levi-Civita" \
          LT-31 Scienze e Tecnologie Informatiche
        ]
      ],
      align(right + horizon)[
        #move(dy: -1em)[
          #image("img/logo_unipd.jpeg", width: 110pt)
        ]
      ]
    )
    
    // CENTRO: Titolo della tesi
    #v(0.65fr)
    #align(center)[
      #text(size: 32pt, weight: "bold", fill: primary)[#title]
    ]
    #v(1fr)
    
    // IN BASSO: Nome (sx), Esame di Laurea (centro), Data (dx)
    #place(bottom + left)[
      #text(size: 20pt, fill: text-color, weight: "bold")[#author]
    ]
    #place(bottom + center)[
      #text(size: 16pt, fill: primary, weight: "bold")[Esame di Laurea]
    ]
    #place(bottom + right)[
      #text(size: 16pt, fill: primary, weight: "bold")[#date]
    ]
  ]
} 

// Funzione base per le diapositive di contenuto
#let slide(topic: "", title: "", content) = {
  page(
    header: [
      #place(top + left, dx: -3em, dy: -3em)[
        #block(width: 100pt, height: 3.5em, fill: primary)[
          #align(left + horizon)[
            #pad(left: 3em, text(fill: white, size: 14pt, weight: "bold")[#topic])
          ]
        ]
      ]
    ]
  )[
    #align(center)[
      #text(size: 26pt, weight: "bold", fill: primary)[#title]
    ]
    #v(1.5em)
    #content
  ]
}

// ==========================================
// INIZIALIZZAZIONE E CONTENUTO
// ==========================================
#show: conf

// --- DIAPOSITIVA 1: COPERTINA ---
#title-slide(
  title: "Kargo: Applicazione Web per la Logistica dello Scarico Merci",
  author: "Suar Alberto",
  date: "10 Luglio 2026"
)

// (Sezione Indice rimossa come richiesto. Puoi inserire qui sotto le chiamate #slide per le prossime pagine)