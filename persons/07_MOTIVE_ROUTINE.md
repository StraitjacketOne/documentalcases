# Truthkeeper - Motive-Analyse-Routine (07_motive.md)

**Erstellt:** 2025-12-22
**Version:** 1.0
**Zweck:** Erklaert das WARUM hinter dem Verhalten jeder Person

---

> **GEHOERT ZU:** [ANALYSE_ROUTINE.md](ANALYSE_ROUTINE.md)
>
> **DATEIPFAD:** `persons/{NAME}/07_motive.md`

---

## Uebersicht

Die 07_motive.md erklaert **scheinbare Widersprueche** im Verhalten einer Person.

**Problem:** Eine Person sagt am 29.01. "Ich rufe doch nicht die Bullen!" und ruft am 07.06. die Polizei.

**Loesung:** 07_motive.md dokumentiert den Richtungswechsel und das dahinterliegende Motiv.

---

## Struktur der 07_motive.md

```markdown
# [PERSON] - Motive und Richtungswechsel

**Erstellt:** [DATUM]
**Status:** [In Arbeit / Komplett]

---

## Motiv-Chronologie

| Zeitraum | Verhalten | Motiv-Kategorie | Beleg |
|----------|-----------|-----------------|-------|
| MM/YYYY  | Was tat die Person? | KATEGORIE: Erklaerung | Quelle |

---

## Detailanalyse pro Richtungswechsel

### Wechsel 1: [Titel]

**Vorher:** [Verhalten A]
**Nachher:** [Verhalten B]
**Zeitpunkt:** [Datum]
**Ausloser:** [Was hat den Wechsel verursacht?]
**Motiv:** [Kategorie + Erklaerung]
**Belege:**
- [Quelle 1]
- [Quelle 2]

---

## Offene Fragen (fuer Reverse-Interview)

1. [Frage]
2. [Frage]
```

---

## Motiv-Kategorien

| Kategorie | Bedeutung | Typische Anzeichen |
|-----------|-----------|-------------------|
| **EIGENINTERESSE** | Karriere, Geld, Selbstschutz | Handelt zum eigenen Vorteil |
| **FREMDSTEUERUNG** | Druck von aussen, Anweisungen, Noetigung | Ploetzlicher Kurswechsel nach Treffen |
| **IDEOLOGIE** | Ueberzeugung, Weltbild, Vorurteile | Konsistente Haltung ohne Faktengrundlage |
| **SUCHT/KRANKHEIT** | Alkohol, Drogen, psychische Probleme | Unberechenbares Verhalten, Ausfaelle |
| **ANGST** | Vor Aufdeckung, vor Konsequenzen, vor Verlust | Eskalierendes Verhalten bei Nachfragen |
| **LOYALITAET** | Zu Person oder Institution | Schuetzt andere trotz eigenem Schaden |
| **RACHE/EMOTION** | Vergeltung, Wut, Eifersucht | Irrationale Handlungen nach Konflikt |

---

## REVERSE-INTERVIEW-WORKFLOW

### Zweck

Claude sieht Daten, aber nicht immer den Kontext dahinter.
Mark fuellt die Luecken durch strukturiertes Interview.

### Ablauf

```
PHASE 1: RECHERCHE
├── Claude analysiert Person in allen Quellen
├── Notiert Widersprueche und Luecken
└── Formuliert konkrete Fragen

PHASE 2: INTERVIEW
├── Mark erhaelt Fragenliste
├── Beantwortet mit Kontext und Hintergrund
└── Verweist auf zusaetzliche Belege falls vorhanden

PHASE 3: DOKUMENTATION
├── Claude traegt Antworten in 07_motive.md ein
├── Jede Antwort wird zum Beleg
└── Interview-Datum macht Quelle verifizierbar
```

### Beispiel-Fragenliste

```markdown
## Offene Fragen zu Aleksandra Kasprzak

1. **Audio 29.01.2025:** Sie sagt "Ich rufe doch nicht die Bullen!"
   **Audio RA Wagner 16.06.2025:** Sie hat Polizei gerufen.
   **FRAGE:** Was ist zwischen Januar und Juni passiert, das sie umgestimmt hat?

2. **Audio 23.04.2025:** 77 Minuten besoffen.
   **Kuhn 16.07.2025:** "Keine Anhaltspunkte Alkoholkonsum"
   **FRAGE:** Hat Kuhn jemals direkten Kontakt mit ihr in dieser Zeit gehabt?

3. **Sie erwaehnt "Bohnenberger" drohte mit Gericht.**
   **FRAGE:** War das ein einmaliges Treffen oder wiederholter Druck?
```

### Ergebnis im 07_motive.md

Nach dem Interview:

```markdown
| 01/2025 | Weigert sich Zettel zu unterschreiben | EIGENINTERESSE | Audio 29.01.2025 |
| 01/2025 | Unterschreibt doch | FREMDSTEUERUNG: Bohnenberger droht | Audio 29.01.2025, Interview 22.12.2025 |
| 04/2025 | 77 Min besoffen, "Ich bin Gewinner" | SUCHT + EMOTION | Audio 23.04.2025 |
| 06/2025 | Ruft Polizei bei Vaterkontakt | FREMDSTEUERUNG: Konditionierung | RA Wagner 16.06.2025 |
| 07/2025 | Behauptet "1,5 Jahre trocken" | ANGST: Vor Konsequenzen | Becker-Bericht 22.07.2025 |
```

---

## Vorteile dieser Methode

1. **Nachvollziehbarkeit:** Dritten ist klar WER, WANN, WAS, WARUM
2. **Beleg-Kette:** Jede Behauptung hat eine Quelle
3. **Interview-Transparenz:** Datum macht Mark's Aussagen verifizierbar
4. **Muster-Erkennung:** Kategorien zeigen systemische Probleme
5. **Entlastung/Belastung:** Zeigt ob Person Taeter oder Werkzeug ist

---

## Anwendung auf verschiedene Akteurs-Typen

### Typ 1: Instrumentalisierte Person (z.B. Kindesmutter)

Zeigt: Wie wurde sie zum Werkzeug gemacht?
- Eigene Schuld vs. Fremdsteuerung
- Wann hatte sie noch eigenen Willen?
- Ab wann handelte sie nur noch auf Befehl?

### Typ 2: Beamter/Institution (z.B. Kuhn, Becker)

Zeigt: Karriere-Motive, Angst vor Aufdeckung, Loyalitaet zur Institution
- Wann haette er/sie anders handeln koennen?
- Welche Vorteile hatte das Fehlverhalten?
- Gab es Druck von oben?

### Typ 3: Entscheider (z.B. Richter Hellenthal)

**ACHTUNG:** Hochkomplex, grosse Kapazitaet noetig!
- Viele Dokumente, viele Entscheidungen
- Muster ueber Jahre
- Fuer spaeter aufheben wenn Basis steht

---

## Checkliste fuer neue 07_motive.md

- [ ] Alle chronologischen Richtungswechsel identifiziert?
- [ ] Jeder Wechsel hat Vorher/Nachher dokumentiert?
- [ ] Motiv-Kategorie zugeordnet?
- [ ] Beleg (Audio/Dokument/Interview) vorhanden?
- [ ] Offene Fragen fuer Reverse-Interview notiert?
- [ ] Interview durchgefuehrt und dokumentiert?

---

## Naechste Schritte

1. **Aleksandra Kasprzak:** 07_motive.md erstellen (Prioritaet 1)
2. **Lena Kuhn:** 07_motive.md erstellen
3. **Wolfgang Becker:** 07_motive.md erstellen
4. **Stefan Bohnenberger:** 07_motive.md erstellen
5. **(Spaeter) Richter Hellenthal:** Wenn Basis steht

---

**Fuer Nicolas - Handle entsprechend.**
