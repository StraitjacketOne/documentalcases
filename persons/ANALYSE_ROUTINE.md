# Truthkeeper - Personen-Analyse-Routine

**Erstellt:** 2025-12-15
**Version:** 1.0
**Zweck:** Standardisierte Analyse jeder Person im Fall

---

## Uebersicht

Diese Routine beschreibt, wie eine neue Claude-Session eine Person systematisch analysieren kann, um die WAHREN EREIGNISSE herauszuarbeiten.

---

## Voraussetzungen

1. Zugriff auf genesis DB (PostgreSQL)
2. Zugriff auf factcheck_db (PostgreSQL)
3. Schreibzugriff auf /mnt/i/data/documents/documentalcases/persons/

---

## Schritt 1: Person auswaehlen

Abfrage der wichtigsten Personen:

    SELECT canonical_name, category, db_mentions, case_relevance 
    FROM person_v2 
    ORDER BY db_mentions DESC;

---

## Schritt 2: Ordner anlegen

    mkdir -p /mnt/i/data/documents/documentalcases/persons/{CANONICAL_NAME}

---

## Schritt 3: Dateien erstellen

### 00_basis.md
- Stammdaten aus person_v2
- Institution, Rolle, Zeitraum
- Aliases (wichtig fuer Suche)

Abfrage:

    SELECT * FROM person_v2 WHERE canonical_name = {NAME};

### 01_dokumente.md
- Alle verknuepften Dokumente
- Chronologisch sortiert
- Schluesseldokumente hervorheben

Abfrage:

    SELECT d.date, d.title, d.summary 
    FROM documents d 
    JOIN document_persons_v2 dp ON d.id = dp.document_id 
    JOIN person_v2 p ON dp.person_id = p.id 
    WHERE p.canonical_name = {NAME} 
    ORDER BY d.date;

### 02_audio.md
- Audio-Dateien die Person erwaehnen
- Suche nach allen Aliases\!
- Review-Status notieren

Abfrage:

    SELECT a.filename, a."eventDate", COUNT(s.id) 
    FROM "AudioFile" a 
    JOIN "Snippet" s ON a.id = s."audioId" 
    WHERE s.text ILIKE %{NAME}% 
    GROUP BY a.id 
    ORDER BY a."eventDate";

### 03_diskrepanzen.md
- Vergleich: Was sagen Dokumente vs. was zeigen Audios?
- Tabelle: Offiziell | Tatsaechlich
- Konkrete Beispiele mit Zitaten

### 04_bewertung.md
- Credibility Rating (1-10)
- Zusammenfassung der Erkenntnisse
- Empfehlung fuer DB-Update
- Offene Fragen
- Quellenverzeichnis

### 05_verbindungen.md
- Netzwerk der Person
- Wer beauftragt, wer schuetzt, wer kooperiert
- Hierarchien und Abhaengigkeiten
- ASCII/Cypher-Visualisierung moeglich

### 06_aussagen.md (KRITISCH!)
- Woertliche Zitate der Person
- Jede Aussage mit:
  - **Wortlaut** (exakt)
  - **Datum**
  - **Quelle Genesis** (Dokument)
  - **Quelle Factcheck** (Audio-Snippet falls vorhanden)
  - **Beweiswert** (1-10)
  - **Verwendung** (Wo einsetzen: Anklage, Plaedoyer, Presse)

**WICHTIG:** Diese Datei ist das Herzstück für:
- Interaktive Anklageschrift
- Faktenbasiertes Plaedoyer
- TruthPlayer-Integration (siehe Notiz unten)

---

## TruthPlayer-Integration

**NOTIZ:** Der TruthPlayer (Nebenprojekt) wird hier zum Einsatz kommen!

Jede Aussage in 06_aussagen.md kann:
1. Als Text angezeigt werden (Genesis-Dokument)
2. Als Audio abgespielt werden (Factcheck-Snippet)
3. Interaktiv verlinkt werden

**Vision: Interaktive Anklageschrift**

Jede Behauptung in der Anklageschrift:
- Kann angeklickt werden
- Spielt sofort den Beweis ab (Text + Audio)
- Untrennbare Beweiskette: AUSSAGE <-> QUELLE <-> AUDIO

**Struktur der Verbindung:**

```
06_aussagen.md
    |
    +-- Wortlaut (exaktes Zitat)
    |
    +-- Quelle Genesis (Dokument-Referenz)
    |       |
    |       +-- extracted/[dokument].txt
    |
    +-- Quelle Factcheck (Audio-Referenz)
            |
            +-- audio/snippets/[snippet].mp3
```

**Ergebnis:** Eine Beweiskette die nur Gott trennen sollte.

---

## Schritt 4: DB aktualisieren (optional)

Nach Review durch Mark:

    UPDATE person_v2 
    SET 
      credibility_rating = {RATING},
      actual_role = {ACTUAL_ROLE},
      notes = {NOTES}
    WHERE canonical_name = {NAME};

---

## Wichtige Regeln

1. **Keine Annahmen** - nur dokumentierte Fakten
2. **Beide Quellen** - Dokumente UND Audios pruefen
3. **Zitate** - immer mit Snippet-Nummer oder Dokument-Datum
4. **Review-Status** - unreviewte Audios kennzeichnen
5. **Diskrepanzen** - das ist der Kern der Analyse

---

## Beispiel-Analyse

Siehe: /persons/Lena_Kuhn/

Diese Analyse zeigt das Muster:
- Offiziell: "Sachbearbeiterin, kooperative Hilfe"
- Tatsaechlich: Noetigung, Umdeklarierung, Ausschluss des Vaters

---

## Naechste Personen zur Analyse

Prioritaet nach Relevanz:

1. Lena Kuhn (erledigt)
2. Richter Hellenthal (276 mentions)
3. Jaqueline Spang-Heidecker (236 mentions)
4. Nina Meiser (erledigt - 20.12.2025)
5. Beate Brand (erledigt)
6. Bohnenberger (erledigt)
7. Staatsanwalt Carius (erledigt - inkl. 06_aussagen)

---

## Beispiel: 06_aussagen.md

Siehe: `/persons/Staatsanwalt_Carius/06_aussagen.md`

Dieses Dokument zeigt das Format fuer woertliche Aussagen:
- Exakter Wortlaut
- Datum und Quelle
- Beweiswert (1-10)
- Verwendungszweck (Plaedoyer, Presse, Petition)
