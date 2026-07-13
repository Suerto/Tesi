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
    margin: (top: 4em, bottom: 2em, left: 2em, right: 2em),
    
    // HEADER: Progressione scaletta (sx), Titolo Slide (centro), Logo (dx)
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
          align(left + horizon)[Suar Alberto - 15 Luglio 2026],
          align(center + horizon)[Kargo: Logistica Scarico Merci],
          align(right + horizon)[#current di #total]
        )
      } else {
          set text(size: 12pt, fill: primary)
          grid(
            columns: (1fr, 1fr, 1fr),
            align(left + horizon)[Suar Alberto - 15 Luglio 2026],
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
    #v(1fr)
    #align(center)[#text(size: 32pt, weight: "bold", fill: primary)[#title]]
    #v(1fr)
    #place(bottom + left)[#text(size: 20pt, fill: text-color, weight: "bold")[#author]]
    #place(bottom + center)[#text(size: 16pt, fill: primary, weight: "bold")[Esame di Laurea]]
    #place(bottom + right)[#text(size: 16pt, fill: primary, weight: "bold")[#date]]
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
  date: "15 Luglio 2026"
)

#centered-slide(title: "Indice dei Contenuti", section: "")[  
  #align(center)[
    #block(width: 50%, align(left)[
      #text(size: 24pt, fill: primary)[
        1. Contesto Aziendale
        #v(1.0em)
        2. Analisi e Requisiti
        #v(1.0em)
        3. Progettazione
        #v(1.0em)
        4. Sviluppo
        #v(1.0em)
        5. Conclusioni
      ]
    ])
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
    columns: (75%, 25%),
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

    grid(columns: (1fr), row-gutter: 1.5em, align: center,
      image("img/react.png", height: 3em),
      image("img/csharp.png", height: 5em),
      image("img/ef.png", height: 5em)
    )
  )
]

#centered-slide(title: "Kargo: Evoluzione del Dominio", section: "2. Analisi e Requisiti")[
  #align(center)[
    #grid(
      columns: (auto, auto, auto), 
      align: horizon, 
      gutter: 2em,
      move(dx: -6em)[#text(size: 18pt, weight: "bold", fill: luma(100))["Web Service Prenotazione Scarichi"]],
      move(dx: -6.3em)[#text(size: 35pt, fill: accent)[$arrow.r$]],
      image("img/KargoLogo.png", height: 5em)
    )
  ]
  #grid(
    columns: (1fr, auto, 1fr), 
    gutter: 2em, 
    align: center + horizon,
    
    block(width: 100%, fill: luma(248), stroke: 1pt + luma(200), radius: 0.5em, inset: 0.8em)[
      #text(size: 17pt)[*Lato Utente*]
      #align(left)[
        - Gestione completa profilo
        - Operazioni CRUD prenotazioni
      ]
    ],

    text(size: 35pt, fill: primary)[$arrow.r$],

    block(width: 100%, fill: accent.lighten(90%), stroke: 2pt + accent, radius: 0.5em, inset: 0.8em)[
      #text(size: 17pt)[*Integrazione Lato Amministratore*]
      #align(left)[
        - Operazioni CRUD slot orari
        - Gestione massiva slot
        - Annullamento prenotazioni
        - Esportazione PDF e CSV
      ]
    ]
  )
]

#centered-slide(title: "Kargo: Architettura e Sicurezza", section: "3. Progettazione")[
  #v(1.5em)

  #grid(
    columns: (1fr, 1fr),
    gutter: 1.5em,
    
    block(fill: luma(250), stroke: 1.5pt + primary, radius: 0.5em, inset: 1.0em)[
      #text(weight: "bold", fill: primary, size: 16pt)[Architettura Esagonale]
      - Pattern *Ports & Adapters*
      - Isolamento *Core Business*
      - Manutenibilità massimizzata
    ],

    block(fill: luma(250), stroke: 1.5pt + primary, radius: 0.5em, inset: 1.0em)[
      #text(weight: "bold", fill: primary, size: 16pt)[Principi SOLID]
      - Design *OO* scalabile
      - Coesione via *SRP*
      - Disaccoppiamento via *IoC*
    ],

    block(fill: luma(250), stroke: 1.5pt + accent, radius: 0.5em, inset: 1.0em)[
      #text(weight: "bold", fill: accent, size: 16pt)[Autenticazione HttpOnly]
      - Sessioni in Cookie *Secure*
      - No accesso *Client-Side*
      - Prevenzione vulnerabilità *XSS*
    ],

    block(fill: luma(250), stroke: 1.5pt + accent, radius: 0.5em, inset: 1.0em)[
      #text(weight: "bold", fill: accent, size: 16pt)[Rate Limiting]
      - *Throttling* chiamate API
      - Mitigazione attacchi *Brute Force*
      - Prevenzione *DDoS* e sovraccarico
    ]
  )
]

#centered-slide(title: "Kargo: Interfaccia Utente", section: "4. Sviluppo")[
  #grid(
    columns: (1fr),
    align: center,
    
    image("img/viewSlotsForBookingPage.png", width: 92%),
    image("img/viewSlotsForBookingPage2.png", width: 92%)
  )
]

#centered-slide(title: "Kargo: Interfaccia Amministratore", section: "4. Sviluppo")[
  #grid(
    columns: (1fr),
    row-gutter: 2em,
    align: center,
    
    image("img/addSlots.png", width: 92%),
    image("img/viewSlotsPage2.png", width: 92%)
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
        
        circle(
          radius: 4.5em,
          fill: gradient.conic(
            (rgb("005f73"), 0%), (rgb("005f73"), 13.3%),
            (rgb("0a9396"), 13.3%), (rgb("0a9396"), 26.7%),
            (rgb("94d2bd"), 26.7%), (rgb("94d2bd"), 53.3%),
            (rgb("e9d8a6"), 53.3%), (rgb("e9d8a6"), 86.7%),
            (rgb("ee9b00"), 86.7%), (rgb("ee9b00"), 100%)
          )
        ),
        
        grid(
          columns: (auto, 1fr, auto),
          row-gutter: 0.8em,
          column-gutter: 0.5em,
          rect(width: 1em, height: 1em, fill: rgb("005f73"), radius: 0.2em), text(size: 11pt)[Studio tecn], text(size: 11pt, weight: "bold")[40],
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
        
        circle(
          radius: 4.5em,
          fill: gradient.conic(
            (rgb("003049"), 0%), (rgb("003049"), 56.25%),
            (rgb("d62828"), 56.25%), (rgb("d62828"), 100%)
          )
        ),
        
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