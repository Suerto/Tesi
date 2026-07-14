#let primary = rgb("#1A365D") 
#let accent  = rgb("#F59E0B") 
#let text-color = rgb("#333333") 
#let the-slide-title = state("slide-title", "")
#let the-section = state("section", "")

#let conf(doc) = {
  set document(title: "Presentazione Tesi - Kargo", author: "Suar Alberto")
  set text(font: "New Computer Modern", size: 20pt, fill: text-color)
  set list(marker: text(fill: accent)[•])
  
  set page(
    paper: "presentation-16-9",
    margin: (top: 4em, bottom: 1em, left: 1em, right: 1em),
    
    header: context {
      if counter(page).get().first() > 0 { // Cambiato da > 1 a > 2
        grid(
          columns: (1fr, 2fr, 1fr),
          align(left + horizon)[#text(size: 14pt, weight: "bold", fill: primary)[#the-section.get()]],
          align(center + horizon)[#text(weight: "bold", fill: primary)[#the-slide-title.get()]],
          align(right + horizon)[#image("img/logo_unipd.jpeg", height: 50pt)]
        )
      }
    },
    
    footer: context {
      if counter(page).get().first() > 1 { // Cambiato da > 1 a > 2
        let current = counter(page).get().first() - 1 // Sottrae Titolo e Indice
        let total = counter(page).final().first() - 1
        set text(size: 12pt, fill: primary)
        grid(
          columns: (1fr, 1fr, 1fr),
          align(left + horizon)[Suar Alberto - 16 luglio 2026],
          align(center + horizon)[Kargo: Logistica Scarico Merci],
          align(right + horizon)[#current di #total]
        )
      } else {
          set text(size: 12pt, fill: primary)
          grid(
            columns: (1fr, 1fr, 1fr),
            align(left + horizon)[Suar Alberto - 16 luglio 2026],
            align(center + horizon)[Kargo: Logistica Scarico Merci]
          )
      }
    }
  )
  doc
}

#let title-slide(title: "", author: "", date: "") = {
  page(header: none, footer: none, margin: (top: 1em, bottom: 1em, left: 1em, right: 1em))[
    #grid(
      columns: (1fr, auto),
      align(left)[
        #text(size: 14pt, fill: primary, weight: "bold")[
          Università degli Studi di Padova \
          Dipartimento di Matematica "Tullio Levi-Civita" \
          LT-31 Scienze e Tecnologie Informatiche
        ]
      ],
      align(right + horizon)[#image("img/logo_unipd.jpeg", width: 100pt)]
    )
    #v(0.6fr)
    #align(center)[#text(size: 32pt, weight: "bold", fill: primary)[#title]]
    #v(0.4fr)
    #align(center)[#text(size: 20pt, fill: text-color, weight: "bold")[#author - Matricola 2101051]]
    #align(center)[#text(size: 16pt, fill: primary, weight: "bold")[Esame di Laurea]]
    #align(center)[#text(size: 16pt, fill: primary, weight: "bold")[#date]]
  ]
} 

#counter(page).update(0)

#let centered-slide(title: "", section: none, content) = {
  the-slide-title.update(title)
  if section != none {
    the-section.update(section)
  }
  pagebreak(weak: true)
  content
}
#show: conf

#title-slide(
  title: "Kargo: Applicazione Web per la Logistica dello Scarico Merci",
  author: "Suar Alberto",
  date: "16 luglio 2026"
)

#centered-slide(title: "Indice dei Contenuti", section: "")[  

  #align(center)[
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr),
      align: center + horizon,
      row-gutter: 1.2em,
      
      // RIGA 1: Immagini alternate in alto (fasi dispari)
      image("img/ergon.jpg", height: auto),
      [], // Vuoto
      image("img/progettazione.png", height: 4.25em),
      [], // Vuoto
      image("img/KargoLogo.png", height: 3.5em),
      
      // RIGA 2: Nodi della "linea esecutiva"
      circle(radius: 1.5em, fill: primary)[#text(fill: white, weight: "bold", size: 20pt)[1]],
      circle(radius: 1.5em, fill: primary)[#text(fill: white, weight: "bold", size: 20pt)[2]],
      circle(radius: 1.5em, fill: primary)[#text(fill: white, weight: "bold", size: 20pt)[3]],
      circle(radius: 1.5em, fill: primary)[#text(fill: white, weight: "bold", size: 20pt)[4]],
      circle(radius: 1.5em, fill: accent)[#text(fill: white, weight: "bold", size: 20pt)[5]],
      
      // RIGA 3: Testi della scaletta
      text(size: 16pt, weight: "bold", fill: primary)[Contesto\ Aziendale],
      text(size: 16pt, weight: "bold", fill: primary)[Analisi e\ Requisiti],
      text(size: 16pt, weight: "bold", fill: primary)[Progettazione],
      text(size: 16pt, weight: "bold", fill: primary)[Sviluppo],
      text(size: 16pt, weight: "bold", fill: accent)[Conclusioni],
      
      // RIGA 4: Immagini alternate in basso (fasi pari)
      [], // Vuoto
      image("img/analisi.jpg", height: 5em), 
      [], // Vuoto
      image("img/sviluppo.png", height: 5em), 
      []  // Vuoto
    )
  ]
]

#centered-slide(title: "L'Azienda: Ergon Informatica", section: "1. Contesto Aziendale")[
  #place(center + horizon, dx: 0pt)[
    #image("img/ergon.jpg", width: 15em)
  ]

  #place(top + left, dx: 0em, dy: -0.5em)[
    #grid(columns: (auto, auto), gutter: 1em, align: horizon,
      image("img/location.png", width: 4.5em), 
      block(width: 14em, stroke: (left: 2pt + primary), inset: 1em)[
        #text(weight: "bold", fill: primary)[Fondazione e Sede] \
        Castelfranco Veneto \
        Attiva dal 1988
      ]
    )
  ]

  #place(top + right, dx: 0em, dy: -0.5em)[
    #grid(columns: (auto, auto), gutter: 1em, align: horizon,
      block(width: 14em, stroke: (right: 2pt + accent), inset: 1em)[
        #align(right)[
          #text(weight: "bold", fill: accent)[Core Business] \
          Sviluppo ERP per il settore agroalimentare
        ]
      ],
      image("img/gear.jpg", width: 4.5em) 
    )
  ]

  #place(bottom + left, dx: 0em, dy: -1em)[
    #grid(columns: (auto, auto), gutter: 1em, align: horizon,
      image("img/employees.png", width: 4.5em), 
      block(width: 14em, stroke: (left: 2pt + accent), inset: 1em)[
        #text(weight: "bold", fill: accent)[Struttura] \
        Organico attuale di 60 dipendenti
      ]
    )
  ]

  #place(bottom + right, dx: 0em, dy: -1em)[
    #grid(columns: (auto, auto), gutter: 1em, align: horizon,
      block(width: 14em, stroke: (right: 2pt + primary), inset: 1em)[
        #align(right)[
          #text(weight: "bold", fill: primary)[Clientela] \
          Oltre 200 aziende \ in Italia
        ]
      ],
      image("img/clients.png", width: 4.5em) 
    )
  ]
]

#centered-slide(title: "Innovazione: Il Ruolo del Tirocinio", section: "1. Contesto Aziendale")[
  #place(center + horizon)[
    #block(fill: accent.lighten(85%), stroke: 2pt + accent, radius: 0.5em, inset: 2em)[
      #text(weight: "bold", fill: accent, size: 28pt)[STAGE]
    ]
  ]
  
  #place(center + horizon, dx: -13em, dy: -6.5em)[
    #grid(columns: (auto, auto), align: right + horizon, gutter: 1.5em,
      image("img/vb6.png", height: 7.5em), 
      move(dy: 1.5em, dx: 1.75em)[#text(size: 40pt, fill: primary)[$arrow.br$]] 
    )
  ]
  
  #place(center + horizon, dx: -13em, dy: 6.5em)[
    #grid(columns: (auto, auto), align: right + horizon, gutter: 1.5em,
      image("img/devexpress.png", width: 11em), 
      move(dy: -2.5em)[#text(size: 40pt, fill: primary)[$arrow.tr$]] 
    )
  ]
  
  #place(center + horizon, dx: 13em, dy: -7em)[
    #grid(columns: (auto, auto, auto), align: left + horizon, gutter: 1.5em,
      move(dy: 1.5em)[#text(size: 40pt, fill: accent)[$arrow.tr$]], 
      image("img/react.png", height: 3.5em),
      image("img/typescript.png", height: 3.5em)
    )
  ]
  
  #place(center + horizon, dx: 13em, dy: 0em)[
    #grid(columns: (auto, auto, auto), align: left + horizon, gutter: 0.7em,
      move(dx: -0em)[#text(size: 40pt, fill: accent)[$arrow.r$]], 
      image("img/csharp.png", height: 5.5em),
      image("img/dotnet.webp", height: 3.5em)
    )
  ]

  #place(center + horizon, dx: 13em, dy: 7em)[
    #grid(columns: (auto, auto, auto), align: left + horizon, gutter: 1.5em,
      move(dy: -1.5em)[#text(size: 40pt, fill: accent)[$arrow.br$]], 
      image("img/git.webp", height: 3.5em),
      image("img/azure.webp", height: 3.5em)
    )
  ]
]

#centered-slide(title: "Kargo: Contesto e Obiettivi", section: "2. Analisi e Requisiti")[
  #grid(
    columns: (70%, 30%),
    gutter: 2em,
    align: horizon,

    block[
      #text(size: 18pt, weight: "bold", fill: primary)[Dominio e Scopo dell'Applicazione]
      #v(0.8em)
      - *Settore* logistica scarico merci
      - *Core* interfaccia web prenotazione banchine
      - *Obiettivo* decongestionamento piazzali automezzi
      - *Impatto* miglioramento operatività al deposito
    ],

    block[
      #align(center)[
        #text(size: 16pt, weight: "bold", fill: accent)[Stack Tecnologico]
        #grid(
          columns: (1fr), 
          row-gutter: 1.0em, 
          align: center,
          image("img/react.png", height: 3em),
          image("img/csharp.png", height: 5em),
          image("img/ef.png", height: 5em)
        )
      ]
    ]
  )
]

#centered-slide(title: "Kargo: Evoluzione del Dominio", section: "2. Analisi e Requisiti")[
  #align(center)[
    #grid(
      columns: (auto, auto, auto), 
      align: horizon,
      move(dx: -9.5em)[#text(size: 16pt, fill: luma(150), style: "oblique")["Web Service \ Prenotazione Scarichi"]],
      move(dx: -3.5em)[#text(size: 40pt, fill: primary)[$arrow.r$]],
      move(dx: 4.5em)[#image("img/KargoLogo.png", height: 4em)]
    )
  ]
  #grid(
    columns: (1fr, auto, 1.2fr), 
    gutter: 4em, 
    align: top,
    
    // FASE 1: Il sistema di base (Lato Utente)
    grid(
      columns: (1fr),
      row-gutter: 1.0em,
      text(size: 14pt, weight: "bold", fill: luma(150))[LATO UTENTE],
      grid(
        columns: (auto, 1fr),
        gutter: 1em,
        text(fill: primary)[$arrow.r.hook$], text(size: 16pt)[Gestione anagrafica profilo],
        text(fill: primary)[$arrow.r.hook$], text(size: 16pt)[Ricerca disponibilità banchine],
        text(fill: primary)[$arrow.r.hook$], text(size: 16pt)[Operazioni CRUD prenotazioni]
      )
    ),

    // Separatore verticale minimale
    line(length: 12em, angle: 90deg, stroke: 1.5pt + luma(220)),

    grid(
      columns: (1fr),
      row-gutter: 1.0em,
      text(size: 14pt, weight: "bold", fill: luma(150))[LATO AMMINISTRATORE],

      // Flusso UI Stepper
      grid(
        columns: (auto, 1fr),
        column-gutter: 1.5em,

        circle(radius: 1.2em, fill: accent)[#align(center + horizon)[#text(fill: white, weight: "bold", size: 14pt)[1]]],
        align(horizon)[#text(size: 16pt)[*Pianificazione* \ Creazione massiva e CRUD slot]],

        grid.cell(align: center)[#v(0.3em) #line(length: 1.5em, angle: 90deg, stroke: 2pt + accent) ],
        [],

        circle(radius: 1.2em, fill: accent)[#align(center + horizon)[#text(fill: white, weight: "bold", size: 14pt)[2]]],
        align(horizon)[#text(size: 16pt)[*Gestione Operativa* \ Monitoraggio prenotazioni]],

        grid.cell(align: center)[ #line(length: 1.5em, angle: 90deg, stroke: 2pt + accent) #v(0.3em)],
        [],

        circle(radius: 1.2em, fill: accent)[#align(center + horizon)[#text(fill: white, weight: "bold", size: 14pt)[3]]],
        align(horizon)[#text(size: 16pt)[*Reportistica* \ Esportazione in PDF e CSV]]
      )
    )
  )
]

#centered-slide(title: "Kargo: Architettura e Sicurezza", section: "3. Progettazione")[

  #align(center)[
    #box(width: 15em, height: 17.5em)[
      #place(
        polygon(
          stroke: 3pt + primary,
          (50%, 0%), (100%, 25%), (100%, 75%), (50%, 100%), (0%, 75%), (0%, 25%)
        )
      )
      
      // Frontend e API REST
      #place(left + horizon, dy: 0.2em, dx: -13em)[
        #grid(
          columns: (auto, auto),
          align: center + horizon,
          gutter: 1.5em,
          block[
            #v(1em)
            #image("img/react.png", height: 3.5em)
            #v(0.5em)
            #text(size: 14pt, weight: "bold", fill: primary)[Frontend]
          ],
          block[
            #text(size: 12pt, weight: "bold", fill: primary)[API REST] \
            #v(0.2em)
            #text(size: 24pt, fill: luma(150))[$arrow.r$]
            #v(0.2em)
            #text(size: 24pt, fill: luma(150))[$arrow.l$]
            #v(0.2em)
            #text(size: 12pt, weight: "bold", fill: primary)[Cookie \ HTTPOnly]
          ]
        )
      ]
      
      #place(left + horizon, dx: -3.95em)[
        #block(fill: white, stroke: 1.5pt + accent, radius: 0.3em, inset: 0.8em)[
          #text(size: 12pt, weight: "bold", fill: accent)[Rate Limiter]
        ]
      ]
      
      // Contenuto testuale proporzionato alle nuove dimensioni
      #place(center + horizon)[
        #align(center)[
          #move(dy: -1.9em)[#image("img/csharp.png", height: 7.5em)]

          #v(-2.8em)
          #text(size: 18pt, weight: "bold", fill: text-color)[Architettura Esagonale]

          #text(size: 16pt, fill: luma(100))[Pattern Ports & Adapters]

          
          #text(size: 18pt, weight: "bold", fill: text-color)[Principi SOLID]
          #v(0.4em)
          #text(size: 16pt, fill: luma(100))[Coesione e\ Disaccoppiamento]
        ]
      ]

      // Entity Framework e Database Informix
      #place(right + horizon, dx: 5.8em)[
        #block(fill: white, stroke: 1.5pt + accent, radius: 0.3em, inset: 0.8em)[
          #text(size: 12pt, weight: "bold", fill: accent)[Entity Framework]
        ]
      ]
      
      #place(right + horizon, dy: 0.2em, dx: 13em)[
        #grid(
          columns: (auto, auto),
          align: center + horizon,
          gutter: 1.5em,
          block[
            #move(dy: -0.3em)[#text(size: 24pt, fill: luma(150))[$arrow.r$]]
          ],
          block[
            #v(2em)
            #image("img/informix.png", height: 3.5em)
            #v(0.2em)
            #text(size: 14pt, weight: "bold", fill: primary)[Database \ Informix]
          ],
        )
      ]
    ]
  ]
]

#centered-slide(title: "Kargo: Interfaccia Utente", section: "4. Sviluppo")[
    #v(-1em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 3em,
    align: center + horizon,
    grid(
      columns: (1fr),
      row-gutter: 1.5em,
      image("img/viewSlotsForBookingPage.png", height: 105.35%)
    ),

    // DESTRA: Immagine del Codice
    grid(
      columns: (1fr),
      row-gutter: 1.5em,
      image("img/useCase.png", height: 105.35%) 
    )
  )
]

#centered-slide(title: "Kargo: Sicurezza e Infrastruttura", section: "4. Sviluppo")[
  #v(-1em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 3em,
    align: center + top,
    
    // SINISTRA: Codice Rate Limiter
    grid(
      columns: (1fr),
      row-gutter: 0.2em,
      image("img/rateLimiter.png", height: 100%),
      text(weight: "bold", size: 15pt, fill: primary)[Rate Limiting Middleware]
    ),

    // DESTRA: Codice JWT Cookie
    grid(
      columns: (1fr),
      row-gutter: 0.2em,
      image("img/jwt.png", height: 100%),
      text(weight: "bold", size: 15pt, fill: primary)[Autenticazione JWT (HttpOnly)],
    )
  )
]

#centered-slide(title: "Kargo: Risultati Conseguiti", section: "5. Conclusioni")[
  #text(size: 18pt, weight: "bold", fill: primary)[Sviluppo Backend e API]
  #grid(
    columns: (1fr, 1fr), 
    gutter: 2em,
    block(fill: luma(250), stroke: (left: 4pt + accent), radius: (right: 0.5em), inset: 1.5em)[
      #text(size: 40pt, weight: "bold", fill: accent)[23] \
      #text(size: 16pt, weight: "bold", fill: primary)[Casi d'Uso Implementati]
    ],
    block(fill: luma(250), stroke: (left: 4pt + accent), radius: (right: 0.5em), inset: 1.5em)[
      #text(size: 40pt, weight: "bold", fill: accent)[28] \
      #text(size: 16pt, weight: "bold", fill: primary)[Endpoint REST Sviluppati]
    ]
  )

  // Sezione 2: Requisiti (Dashboard inferiore a 3 colonne)
  #text(size: 18pt, weight: "bold", fill: primary)[Copertura Requisiti]
  #grid(
    columns: (0.4fr, 0.33fr, auto), 
    gutter: 1.0em,
    
    block(fill: primary.lighten(90%), stroke: 1pt + primary, radius: 0.5em, inset: 1.5em, align(center)[
      #text(size: 32pt, weight: "bold", fill: primary)[142 / 142] \

      #text(size: 15pt)[Obbligatori]
    ]),
    
    block(fill: accent.lighten(85%), stroke: 1pt + accent, radius: 0.5em, inset: 1.5em, align(center)[
      #text(size: 32pt, weight: "bold", fill: accent)[6 / 6] \

      #text(size: 15pt)[Desiderabili]
    ]),
    
    block(fill: luma(245), stroke: 1pt + luma(150), radius: 0.5em, inset: 1.5em, align(center)[
      #text(size: 32pt, weight: "bold", fill: luma(100))[4 / 4] \

      #text(size: 15pt)[Opzionali]
    ])
  )
]

#centered-slide(title: "Kargo: Crescita Professionale", section: "5. Conclusioni")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 4em,
    
    // Colonna Sinistra: Hard Skills a schede
    block[
      #text(weight: "bold", fill: primary, size: 20pt)[Competenze Tecniche]
      
      #block(fill: primary.lighten(90%), stroke: (left: 4pt + primary), radius: (right: 0.5em), inset: 1.2em, width: 100%)[
        Padronanza *TypeScript* e *C\#*
      ]
      #block(fill: primary.lighten(90%), stroke: (left: 4pt + primary), radius: (right: 0.5em), inset: 1.2em, width: 100%)[
        Competenze avanzate *System Design*
      ]
      #block(fill: primary.lighten(90%), stroke: (left: 4pt + primary), radius: (right: 0.5em), inset: 1.2em, width: 100%)[
        Efficienza in *Progettazione* e *Codifica*
      ]
    ],

    // Colonna Destra: Soft Skills a schede
    block[
      #text(weight: "bold", fill: accent, size: 20pt)[Soft Skills e Metodo]
      
      #block(fill: accent.lighten(85%), stroke: (left: 4pt + accent), radius: (right: 0.5em), inset: 1.2em, width: 100%)[
        *Problem Solving* autonomo
      ]
      #block(fill: accent.lighten(85%), stroke: (left: 4pt + accent), radius: (right: 0.5em), inset: 1.2em, width: 100%)[
        Gestione ottimizzata *Task* e *Tempo*
      ]
      #block(fill: accent.lighten(85%), stroke: (left: 4pt + accent), radius: (right: 0.5em), inset: 1.2em, width: 100%)[
        Puntualità nelle *Delivery*
      ]
    ]
  )
]

#centered-slide(title: "Bilancio Quantitativo", section: "5. Conclusioni")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 3em,
    
    block[
      #text(weight: "bold", size: 16pt, fill: primary)[Ripartizione Ore (300 h)]
      #v(1em)
      #grid(
        columns: (auto, 1fr),
        gutter: 1.5em,
        align: horizon,
        
        image("img/ore.png", width: 9em),
        
        grid(
          columns: (auto, 1fr, auto),
          row-gutter: 0.8em,
          column-gutter: 0.5em,
          rect(width: 1em, height: 1em, fill: rgb("005f73"), radius: 0.2em), text(size: 11pt)[Studio Tecnologie], text(size: 11pt, weight: "bold")[40],
          rect(width: 1em, height: 1em, fill: rgb("0a9396"), radius: 0.2em), text(size: 11pt)[Analisi / Progettazione], text(size: 11pt, weight: "bold")[40],
          rect(width: 1em, height: 1em, fill: rgb("94d2bd"), radius: 0.2em), text(size: 11pt)[Backend], text(size: 11pt, weight: "bold")[80],
          rect(width: 1em, height: 1em, fill: rgb("e9d8a6"), radius: 0.2em), text(size: 11pt)[Frontend], text(size: 11pt, weight: "bold")[100],
          rect(width: 1em, height: 1em, fill: rgb("ee9b00"), radius: 0.2em), text(size: 11pt)[Test / Documentazione], text(size: 11pt, weight: "bold")[40]
        )
      )
    ],

    block[
      #text(weight: "bold", size: 16pt, fill: accent)[Righe di Codice (> 8.000)]
      #v(1em)
      #grid(
        columns: (auto, 1fr),
        gutter: 1.5em,
        align: horizon,
        
        image("img/codice.png", width: 9em),
        
        grid(
          columns: (auto, 1fr, auto),
          row-gutter: 0.8em,
          column-gutter: 0.5em,
          rect(width: 1em, height: 1em, fill: rgb("003049"), radius: 0.2em), text(size: 11pt)[Backend (C\#)], text(size: 11pt, weight: "bold")[ > 4.500],
          rect(width: 1em, height: 1em, fill: rgb("d62828"), radius: 0.2em), text(size: 11pt)[Frontend (TS)], text(size: 11pt, weight: "bold")[> 3.500]
        )
      )
    ]
  )
  #align(center)[
    #block(fill: luma(248), stroke: 1pt + luma(200), radius: 0.5em, inset: 1.0em, width: 90%)[
      #text(weight: "bold")[3 Documenti redatti] \
      Analisi dei Requisiti - Manuale Utente - Manuale Amministratore
    ]
  ]
]