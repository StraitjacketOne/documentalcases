# Alexander Eichberger - Basis-Analyse

**Erstellt:** 2025-12-21
**Quelle:** kg_db_reference + RAG-Dokumentenanalyse

---

## Stammdaten

| Feld | Wert |
|------|------|
| Canonical Name | Alexander Eichberger |
| Kategorie | JUGENDAMT |
| Aliases | Eichberger, Alexander Eichberger, Eschberger, A. Eichberger, Herr Eichberger |
| Official Role | Amtsvertreter/in |
| Actual Role | ERSTER BLOCKIERER - Systematische Verleugnung der Alkoholproblematik |
| Case Relevance | **HAUPTPERSON** (KORREKTUR von "Nebenperson") |
| DB Mentions | 5 (kg_db) + 8+ Dokumente mit Erwaehnung |
| Erste Erwaehnung | 08.06.2022 |
| Credibility Rating | 2/10 (SEHR NIEDRIG) |

---

## Institution

- Regionalverband Saarbruecken
- FD 51 Jugendamt
- Abteilung Sozialer Dienst
- Erster Fallbearbeiter nach Kindesentziehung 11.05.2022

---

## Zeitraum aktiv im Fall

- Erste Erwaehnung: 08.06.2022 (gem. kg_db)
- Letztes dokumentiertes Gespraech: **14.09.2022**
- Uebergabe an: Herr Bluth (laut Eichberger am 14.09.2022 nachmittags)
- Status: Nicht mehr fallzustaendig (Uebergabe nach 14.09.2022)

---

## KRITISCHES DATUM: 14.09.2022

### Morgens (8:15 Uhr) - Gespraech beim Jugendamt

**Kontext:** Erstes tatsaechliches Gespraech seit Kindesentziehung am 11.05.2022

**Was passierte:**
- Eichberger beteuerte VEHEMENT: "Die Kindesmutter hat kein Alkoholproblem"
- Behauptete: "Keine Hinweise auf Missbrauch"
- Kindesvater wurde rausgeschmissen
- Beschreibung: "Entmenschlichung, Vorfuehrung, Herablassung, Rechtsfreier Raum, Willkuer"

**Zitat aus Faxnachweis 09.01.2024:**
> "Auf meine Frage was sie ueberhaupt denken, was meine Intension sei, wieso sollte ich vor Gericht gehen wenn ich nicht wirklich Angst um meinen Kleinen haette und die Sache nun mal ernster sei als die sie bewerten, wurde mir gesagt: 'Sie kommen nicht hierher und fragen uns, wir fragen sie hoechstens'"

### Nachmittags - Telefonat mit Eichberger

**Auffaellig:** Ploetzlich freundlich und loesungsorientiert (im Gegensatz zum Morgen)
- Verwies auf Herrn Bluth als kuenftigen Ansprechpartner
- Bestaetigte den Unmut des Kindesvaters

---

## DIE EICHBERGER-BOMBE

### 7 Tage spaeter: 21.09.2022

Die Kindesmutter wird im Beisein des gemeinsamen Kindes mit **2 PROMILLE** angetroffen.
- Polizei vor Ort
- Jugendamt (Frau Meiser) entscheidet: KEINE INOBHUTNAHME

**Bedeutung:** Eichberger hatte 7 Tage zuvor vehement behauptet, es gaebe "kein Alkoholproblem"!

---

## Schein vs. Realitaet

| Schein (Offiziell) | Realitaet (Tatsaechlich) |
|-------------------|--------------------------|
| Sachbearbeiter, der Fakten prueft | Blockierte systematisch jede Kommunikation |
| "Keine Hinweise auf Alkoholproblem" | 7 Tage spaeter: 2 Promille mit Kind |
| "Neutral und unvoreingenommen" | Kindesvater durfte nicht reden, wurde rausgeschmissen |
| "Kooperative Hilfe" | Entmenschlichung, Willkuer |

---

## Verbindungen

- **Frau Meiser** - Vorgesetzte, traf Entscheidung am 21.09.2022 (keine Inobhutnahme)
- **Herr Bluth** - Nachfolger als Ansprechpartner
- **Beate Brand** - Teil des Jugendamt-Systems
- **Lena Kuhn** - Kontakt hergestellt am 13.09.2022 (einen Tag vor dem Gespraech)

---

## Bedeutung fuer den Fall

Der 14.09.2022 ist ein SCHLUESSELMOMENT:

1. **Beweist Blockadehaltung:** Eichberger verweigerte sachliche Kommunikation
2. **Beweist Fehleinschaetzung:** 7 Tage spaeter 2 Promille-Vorfall
3. **Muster der Justiztaeuschung:** Wird in Strafanzeigen als Beleg genannt
4. **Uebergabe ohne Konsequenzen:** Nachdem er sich als unfaehig erwiesen hatte

---

## Naechste Schritte

- [ ] 01_dokumente.md - Alle verknuepften Dokumente analysieren
- [ ] 02_audio.md - Audio-Transkripte durchsuchen (Erwaehnung Eichberger)
- [ ] 03_diskrepanzen.md - Weitere Offiziell vs. Tatsaechlich
- [ ] 04_bewertung.md - Credibility Rating begruenden
- [ ] 06_aussagen.md - Woertliche Zitate sammeln

---

## DB-Update Empfehlung

```sql
UPDATE kg_db_reference
SET
  case_relevance = 'Hauptperson',
  actual_role = 'Erster Blockierer - Systematische Verleugnung Alkoholproblematik',
  credibility_rating = 2,
  notes = 'Eichberger-Bombe: 14.09.2022 vehement kein Alkoholproblem - 21.09.2022 Mutter mit 2 Promille'
WHERE canonical_name = 'Alexander Eichberger';
```
