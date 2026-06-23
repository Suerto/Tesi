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

= L'Azienda Ospitante e il Contesto Organizzativo

In questo capitolo viene presentata Ergon Informatica Srl, l'azienda in cui ho svolto l'esperienza di stage. Verranno descritti i modi in cui ho raccolto le informazioni sul campo, l'organizzazione dei team di lavoro e l'approccio della struttura verso le novità tecnologiche nel settore della logistica.

== Profilo aziendale e acquisizione delle informazioni
Questa sezione descrive la struttura dell'azienda e le sue attività principali, concentrate sullo sviluppo di soluzioni software per la gestione dei magazzini e dei flussi di merci. Viene spiegato come ho raccolto i dati necessari per la tesi, lavorando a stretto contatto con il team di sviluppo, confrontandomi con il tutor e studiando la documentazione interna, cercando di dare un quadro chiaro e reale dell'ambiente di lavoro.

== Processi interni e tecnologie
Qui si analizza l'ambiente di lavoro quotidiano, guardando ai metodi utilizzati dall'azienda per organizzare i compiti e gestire i vari rilasci del software. Verranno descritti, in modo generale e concettuale, gli strumenti per il controllo del codice, l'integrazione delle modifiche e le scelte architetturali adottate per creare applicazioni web moderne e flessibili.

== Clientela e propensione all'innovazione
Questa parte mappa i clienti tipo dell'azienda, che operano principalmente nell'ambito dei grandi centri di smistamento e della grande distribuzione. Si esamina l'impegno nel trasformare le operazioni di magazzino da manuali a digitali, con l'obiettivo di ridurre i tempi di attesa e aggiornare i vecchi sistemi di gestione.

#pagebreak()

= Il Dominio Applicativo e gli Obiettivi dello Stage

In questo capitolo vengono esaminati i requisiti di business e i problemi reali legati alla gestione dei flussi di merci in ingresso. Si definisce la collocazione del progetto Kargo all'interno della roadmap strategica aziendale e i vincoli ingegneristici da rispettare.

== Il problema gestionale
In questa sezione viene approfondita l'inefficienza operativa che deriva dalla pianificazione manuale dei turni e degli spazi per lo scarico merci nei magazzini. L'assenza di un sistema centralizzato e aggiornato in tempo reale crea spesso problemi di comunicazione tra i trasportatori e gli operatori a terra, provocando code, ritardi e un aumento dei costi di gestione. Inoltre, viene raccontata la genesi del progetto di tirocinio, spiegando come sia nata l'idea di affrontare questa specifica problematica e come si siano mossi i primi passi per trasformare un'esigenza concreta dell'azienda nel nucleo di questa tesi.

== La strategia aziendale
Si spiega come l'idea alla base di Kargo non sia un progetto isolato, ma faccia parte di un percorso più grande che l'azienda sta seguendo per semplificare e rendere più efficienti le attività logistiche. Verrà inoltre descritto come l'azienda utilizzi storicamente i tirocini universitari per esplorare nuove soluzioni e sviluppare prototipi che, in futuro, possano arricchire i servizi offerti ai clienti.

== La scelta e i vincoli del progetto
Vengono specificati gli obiettivi formali dello stage, quali la realizzazione di un'interfaccia web responsive, la gestione di chiamate asincrone concorrenti per la prenotazione delle baie e i vincoli di retrocompatibilità sui dati. Viene infine motivata la preferenza verso questo progetto per l'opportunità di affrontare problematiche di architettura web e programmazione tipata in contesti enterprise.

#pagebreak()

= Realizzazione del Progetto Kargo

In questo capitolo si descrivono le fasi ingegneristiche necessarie alla costruzione dell'applicazione Kargo. Vengono presentati i criteri di tracciamento dei requisiti, le scelte architetturali mirate alla robustezza del codice e le metriche quantitative derivanti dalle attività di verifica.

== Metodologia di lavoro
La sezione illustra l'applicazione pratica dei principi di ingegneria del software: la scomposizione dei requisiti in casi d'uso, la pianificazione temporale delle attività e l'interazione formale con il tutor aziendale attraverso code review. Si documenta l'uso di diagrammi UML per la modellazione dei componenti e i sistemi di tracciamento dei bug.

== Sviluppo e sfide progettuali
Viene analizzato lo sviluppo del software basato sull'uso di C\# per garantire la massima sicurezza dei tipi a tempo di compilazione ed evitare comportamenti imprevisti a runtime. Si discutono le sfide principali: la gestione dello stato dell'applicazione, la sincronizzazione delle prenotazioni in presenza di richieste simultanee e l'interfacciamento con API RESTful per la persistenza dei dati su database relazionali.

== Risultati raggiunti
Vengono esposti i risultati ottenuti valutando il prodotto sotto due aspetti fondamentali:
- *Profilo qualitativo:* l'esperienza d'uso dell'applicazione dal lato del trasportatore (portale di prenotazione) e del gestore del magazzino (dashboard di monitoraggio banchine).
- *Profilo quantitativo:* l'analisi numerica del codice prodotto, esplicitando il grado di copertura dei requisiti concordati e le metriche di code coverage ottenute tramite la suite di test automatizzati sviluppata.
#pagebreak()

= Valutazione Retrospettiva dell'Esperienza

In questo capitolo conclusivo viene redatto un bilancio critico del periodo di stage. Si confrontano i risultati misurabili con le aspettative iniziali e si analizza l'efficacia del percorso accademico rispetto alle reali richieste del mercato del lavoro.

== Raggiungimento degli obiettivi
Si valuta l'efficacia del lavoro svolto confrontando i deliverable finali con la tabella dei requisiti iniziali. La verifica si basa su dati empirici, quali il superamento dei test di accettazione e l'effettiva usabilità della piattaforma nei test di carico, escludendo valutazioni di natura soggettiva.

== Crescita professionale
Vengono descritte le competenze tecniche consolidate durante il progetto, con particolare riferimento alle buone pratiche di sviluppo in _C\#_ e _React_, alla configurazione di ambienti di testing rigorosi e all'ottimizzazione del codice per ambienti web ad alte prestazioni, oltre alla maturazione di capacità di problem-solving in contesti aziendali.

== Analisi del percorso di studi
Viene eseguito un confronto tra il bagaglio teorico fornito dal corso di laurea (basi di dati, ingegneria del software) e le competenze pratiche richieste sul campo. Si analizzano in modo costruttivo le discrepanze riscontrate, evidenziando l'importanza di concetti avanzati di type safety e architetture frontend moderne spesso demandati all'apprendimento autonomo.

#pagebreak()

= *Glossario*

In questa sezione vengono raccolti i termini tecnici specialistici legati sia al dominio della logistica (es. _3PL_, _baia di carico_, _slotting_) sia all'ambito tecnologico software (es. _type safety_, _mocking_, _state management_). Ciascun termine viene introdotto nel testo con una definizione preliminare per mantenere la continuità di lettura, trovando qui il suo completamento formale.