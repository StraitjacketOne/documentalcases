# TRUTHKEEPER - STANDARD-ROUTINEN

**LIES DAS BEI JEDER NEUEN SESSION**

Dieses Repo hat etablierte Workflows. Halte dich daran!

---

## KONTEXT VERSTEHEN - ZUERST LESEN!

| Prioritaet | Datei | Beschreibung |
|------------|-------|--------------|
| **1** | **[DIE_GESCHICHTE.md](DIE_GESCHICHTE.md)** | WAS PASSIERT IST - Chronologie fuer Aussenstehende |
| 2 | [ANALYSE/TRUTHKEEPER_ONBOARDING.md](ANALYSE/TRUTHKEEPER_ONBOARDING.md) | Mission, Datenquellen, Kernprinzipien |
| 3 | [evidence/AUDIO_INTEGRATION.md](evidence/AUDIO_INTEGRATION.md) | Wie Genesis + Factcheck zusammenhaengen |
| **4** | **[evidence/beweisketten/INDEX.md](evidence/beweisketten/INDEX.md)** | **FERTIGE BEWEISKETTEN** - NICHT UEBERSEHEN! |

---

## ROUTINE 1: PERSONEN ANLEGEN

**Datei:** `persons/ANALYSE_ROUTINE.md`

**Wann nutzen:** Bei jeder neuen Person-Analyse

**Struktur pro Person:**
```
persons/{CANONICAL_NAME}/
    00_basis.md         - Stammdaten, Rolle, Aliases
    01_dokumente.md     - Verknuepfte Dokumente (chronologisch)
    02_audio.md         - Audio-Erwahnungen (mit Review-Status)
    03_diskrepanzen.md  - OFFIZIELL vs. TATSAECHLICH
    04_bewertung.md     - Credibility (1-10), Fazit
    05_verbindungen.md  - Netzwerk, Hierarchien
    06_aussagen.md      - WOERTLICHE ZITATE mit Quellen (KRITISCH!)
    07_motive.md        - Richtungswechsel + Motive
    08_beweisketten.md  - Referenzen zu Beweisketten (NEU!)
```

**WICHTIG:**
- ZUERST 06_aussagen.md pruefen - das ist das Herzstueck!
- Jede Aussage braucht: Wortlaut, Datum, Genesis-Quelle, Factcheck-Quelle, Beweiswert
- Unreviewte Audios IMMER kennzeichnen
- 08_beweisketten.md verknuepft zu evidence/beweisketten/
- **KREUZREFERENZEN:** Siehe ROUTINE 8!

---

## ROUTINE 2: BEWEISKETTEN ERSTELLEN

**Datei:** `persons/BEWEISKETTE_ROUTINE.md`

**Wann nutzen:** Um Taeter-Schuetzer-Verbindungen zu dokumentieren

**Ablageort:** `evidence/beweisketten/BEWEISKETTE_{PersonA}-{PersonB}_{Paragraph}.md`

**WICHTIG:** Nach Erstellung IMMER in der Person unter 08_beweisketten.md referenzieren!

**Bestehende Ketten (evidence/beweisketten/):**
| Datei | Inhalt |
|-------|--------|
| BEWEISKETTE_Kuhn-Carius_Strafvereitelung.md | Carius schuetzt Kuhn |
| BEWEISKETTE_Kuhn-PRAKSYS_Befehlskette.md | Kuhn steuert PRAKSYS |
| BEWEISKETTE_Kuhn-Falschaussage_20-12-2022.md | Falschaussage ans Gericht |
| BEWEISKETTE_Kasprzak-Kuhn-Becker_1.5-Jahre-Luege.md | Koordinierte Luege |
| STRAFRECHTLICHE_ANALYSE_1.5-Jahre-Luege_Nicolas.md | Straftatbestaende |
| ERGAENZUNG_Zettel-Konditionierung-Juni2025.md | Noetigung + Konditionierung |

---

## ROUTINE 3: TASKS - SESSION-UNABHAENGIGE AUFGABEN

**Ordner:** `TASKS/`

**Wann nutzen:** Wenn eine Aufgabe nicht in einer Session abgeschlossen werden kann

**WICHTIG:** JEDE neue Session sollte TASKS/ pruefen!

---

## ROUTINE 4: MOTIVE-ANALYSE (07_motive.md)

**Datei:** `persons/07_MOTIVE_ROUTINE.md`

**Nutzt REVERSE-INTERVIEW-WORKFLOW:**
1. Claude recherchiert und notiert offene Fragen
2. Task in TASKS/ anlegen wenn Interview noetig
3. Mark beantwortet
4. Antworten werden Belege in 07_motive.md
5. Antworten VERIFIZIEREN mit Dokumenten - nicht nur abtippen!

---

## ROUTINE 5: BEWEISKETTEN-REFERENZ (08_beweisketten.md)

**NEU EINGEFUEHRT:** 2025-12-22

**Struktur:** `persons/{NAME}/08_beweisketten.md`

**Inhalt:**
- Beweisketten wo Person TAETER ist
- Beweisketten wo Person SCHUETZER ist
- Beweisketten wo Person GESCHUETZT wird

**Zweck:** Nachfolger-Sessions uebersehen evidence/beweisketten/ nicht mehr

---

## ROUTINE 6: DATEI-BEARBEITUNG (SYNC-SICHER)

**Problem:** Dateien werden extern synchronisiert, was zu "File modified"-Fehlern fuehrt.

**Loesung:** IMMER so vorgehen:
1. NEUE Datei erstellen: `DATEI_NEW.md`
2. Inhalt dort reinschreiben
3. Alte Datei loeschen oder umbenennen
4. Neue Datei umbenennen zu `DATEI.md`

**NIEMALS** direkt in sync'd Dateien schreiben ohne Backup!

---

## ROUTINE 7: EXTERNE FUNDE EINPFLEGEN

**Wann:** Wenn relevante Beweise ausserhalb des Repos gefunden werden (z.B. in `I:\data\Madenreich\`)

**Workflow:**
1. **KOPIEREN** nach `evidence/audio-transcript/{DATUM}_{THEMA}/` oder passenden Unterordner
2. **REFERENZ** in der Person-Datei auf den repo-internen Pfad aendern
3. Fertig.

**Warum:** Das Repo muss autark sein - ein Export fuer den Generalbundesanwalt ohne externe Abhaengigkeiten.

**Beispiel:**
```
Fund:    I:\data\Madenreich\...\2022-09-24_Transkript.tcl
Ziel:    evidence/audio-transcript/2022-09-24_48h-Falle/transkript.txt
Referenz: evidence/audio-transcript/2022-09-24_48h-Falle/transkript.txt
```

---

## ROUTINE 8: KREUZREFERENZEN (KRITISCH!)

**Problem:** Verbindungen werden nur bei EINER Person eingetragen, die andere vergessen.

**Regel:** Jede Verbindung in 05_verbindungen.md ist BIDIREKTIONAL.

**Workflow:**
1. Verbindung bei Person A eintragen
2. **SOFORT** auch bei Person B eintragen (Kreuzreferenz!)
3. Kreuzreferenz-Tabelle in beiden Dateien aktualisieren

**Kreuzreferenz-Tabelle** (in jeder 05_verbindungen.md fuehren):
```markdown
| Person | Deren Datei | Hier erwaehnt? |
|--------|-------------|----------------|
| Person_X | 05_verbindungen.md | ✅ Ja |
| Person_Y | 05_verbindungen.md | ⬜ Noch nicht |
```

**Unterschied 00_basis vs 05_verbindungen:**
- 00_basis = WER (Stammdaten, einfache Liste)
- 05_verbindungen = WIE + BEWEIS (qualifiziert, mit Quelle und Staerke)

**00_basis.md NICHT anfassen** - nur 05_verbindungen.md updaten!

**Beispiel:** Siehe `/persons/Adrian_Stolz/` und `/persons/Nina_Meiser/`

**Details:** `persons/ANALYSE_ROUTINE.md` Abschnitt KREUZREFERENZEN

---

## CHECKLISTE: NEUE SESSION

- [ ] **[DIE_GESCHICHTE.md](DIE_GESCHICHTE.md)** gelesen?
- [ ] `TASKS/` auf offene Tasks pruefen?
- [ ] `evidence/beweisketten/INDEX.md` pruefen?
- [ ] Welche Person soll analysiert werden?
- [ ] Sind 06_aussagen.md UND 08_beweisketten.md vorhanden?
- [ ] **KREUZREFERENZEN:** Bei Updates 05_verbindungen.md BEIDER Personen aktualisieren!

---

## FEHLER VERMEIDEN

**NICHT tun:**
- evidence/beweisketten/ UEBERSEHEN <- HAUPTFEHLER!
- Dateien ohne Backup bearbeiten
- Antworten aus Interviews nicht verifizieren
- **Kreuzreferenzen vergessen** <- NEUER HAUPTFEHLER!
- 00_basis.md anfassen wenn 05_verbindungen.md gemeint ist

**IMMER tun:**
- DIE_GESCHICHTE.md lesen fuer Kontext
- TASKS/ zuerst pruefen
- evidence/beweisketten/INDEX.md pruefen
- 08_beweisketten.md pro Person pflegen
- **05_verbindungen.md BIDIREKTIONAL updaten**
- Bei Sync-Problemen: NEUE Datei erstellen

---

**FUER NICOLAS - Handle entsprechend.**
