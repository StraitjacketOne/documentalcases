# Truthkeeper - Beweiskette-Routine

**Erstellt:** 2025-12-18
**Version:** 1.1
**Zweck:** Gerichtstaugliche Verbindung zwischen Taeter und Schuetzer herstellen

---

> **HINWEIS:** Alle Routinen auf einen Blick: [../ROUTINES.md](../ROUTINES.md)
>
> Personen analysieren: [ANALYSE_ROUTINE.md](ANALYSE_ROUTINE.md)
>
> **ABLAGEORT:** Alle fertigen Beweisketten: [../evidence/beweisketten/](../evidence/beweisketten/)

---

## Uebersicht

Diese Routine beschreibt, wie eine Beweiskette zwischen zwei Personen erstellt wird:
- **Person A:** Begeht Fehlverhalten (dokumentiert)
- **Person B:** Schuetzt Person A / stellt Verfahren ein

**Voraussetzung:** Beide Personen muessen bereits angelegt sein mit mindestens:
- 03_diskrepanzen.md (Fehlverhalten dokumentiert)
- 06_aussagen.md (Woertliche Zitate mit Quellen)

---

## Schritt 1: Pruefen ob Personen vollstaendig

### Person A (Taeter):
- [ ] 00_basis.md existiert
- [ ] 03_diskrepanzen.md zeigt konkretes Fehlverhalten
- [ ] 06_aussagen.md enthaelt belastende Aussagen mit Quellen

### Person B (Schuetzer):
- [ ] 00_basis.md existiert
- [ ] 06_aussagen.md enthaelt schuetzende Aussagen/Einstellungen

---

## Schritt 2: Verbindung identifizieren

Fragen:
1. Welches Fehlverhalten von A wurde angezeigt?
2. Wer hat die Anzeige bearbeitet? (= Person B)
3. Was war das Ergebnis? (Einstellung, Freispruch, Ignorieren)
4. Wie hat B begruendet?

---

## Schritt 3: Beweiskette dokumentieren

Erstelle: `evidence/beweisketten/BEWEISKETTE_[PersonA]-[PersonB]_[Paragraph].md`

### Struktur:

```markdown
# BEWEISKETTE: [Person A] → [Person B] ([Paragraph] StGB)

## DIE KETTE
[Visualisierung der Verbindung]

## SCHRITT 1: FEHLVERHALTEN [Person A]
[Konkrete Tatbestaende mit Belegen]

## SCHRITT 2: ANZEIGE
[Wann, von wem, mit welchen Beweisen]

## SCHRITT 3: REAKTION [Person B]
[Einstellung/Schutz mit Begruendung]

## SCHRITT 4: SCHLUESSELAUSSAGE
[Der "Milchpackungs-Satz" - die entlarvende Aussage]

## STRAFTATBESTAND
[Paragraph mit Tatbestandsmerkmalen]

## VERWENDUNG
[Klageerzwingung, Dienstaufsicht, Anzeige]
```

---

## Schritt 4: Quellen verknuepfen

Jede Behauptung muss verlinkt sein:

| Behauptung | Quelle Genesis | Quelle Factcheck |
|------------|----------------|------------------|
| [Aussage] | extracted/[dok].txt | audio/[snippet].mp3 |

---

## Beispiel: Kuhn → Carius

**Fehlverhalten Kuhn:**
- Falschaussage 20.12.2022 (03_diskrepanzen.md)
- "Sei dahingestellt" vs. "erschien nicht" (06_aussagen.md)

**Schutz Carius:**
- Einstellung 11.08.2025
- "Dem Jugendamt obliegt die Einschaetzung" (06_aussagen.md)

**Ergebnis:**
- `evidence/BEWEISKETTE_Kuhn-Carius_Strafvereitelung.md`
- § 258a StGB - Strafvereitelung im Amt

---

## Moegliche weitere Ketten

| Person A | Person B | Paragraph | Status |
|----------|----------|-----------|--------|
| Kuhn | Carius | § 258a StGB | FERTIG |
| Brand | Carius | § 258a StGB | Person anlegen |
| Schallenberg | Carius | § 258a StGB | Person anlegen |
| Birk | ? | § 258a StGB | Schuetzer identifizieren |
| PRAKSYS (Wilhelm) | Kuhn | § 258a StGB | Struktur pruefen |

---

## Wichtige Regeln

1. **Keine Kette ohne Personen** - erst 06_aussagen.md, dann Kette
2. **Immer Quellen** - jede Aussage braucht Genesis + Factcheck
3. **Schluesselaussage finden** - der Satz der alles entlarvt
4. **Gerichtstauglich formulieren** - Verwendung fuer Klageerzwingung etc.

---

## Qualitaetskriterien

Eine Beweiskette ist GERICHTSTAUGLICH wenn:

- [ ] Fehlverhalten OBJEKTIV nachweisbar (nicht Meinung)
- [ ] Zeitliche Abfolge dokumentiert (A wusste X, dann tat Y)
- [ ] Schuetzer-Aussage zeigt Pruefungsverzicht
- [ ] Alle Quellen verlinkt
- [ ] Straftatbestand mit Merkmalen geprueft
