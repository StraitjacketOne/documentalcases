# Christin Lehne - Audio

**Erstellt:** 2025-12-17
**Quelle:** factcheck_db

---

## Audio-Dateien

### 2023-08-30 - "Unfassbarer Umgang mit Mandanten" (5 Teile)

| Teil | AudioFile-ID | Dateiname |
|------|--------------|-----------|
| 01 | 2583ff89-9414-47d6-ab8f-48ceb88bdff1 | 2023-08-30_Lehne_Unfassbarer_Umgang_mit_Mandanten_01.mp3 |
| 02 | 9ae5faa0-914b-4249-bcac-5fa89713aab6 | 2023-08-30_Lehne_Unfassbarer_Umgang_mit_Mandanten_02.mp3 |
| 03 | 180f23b6-28c2-4327-9e4e-e0665648243a | 2023-08-30_Lehne_Unfassbarer_Umgang_mit_Mandanten_03.mp3 |
| 04 | 465a5f2d-d326-432d-85e6-d43d8fc5aec4 | 2023-08-30_Lehne_Unfassbarer_Umgang_mit_Mandanten_04.mp3 |
| 05 | e3b318bd-9fd4-49ee-a898-9fd296334918 | 2023-08-30_Lehne_Unfassbarer_Umgang_mit_Mandanten_05.mp3 |

**Kontext**: 5 Tage VOR der Beschwerderücknahme (04.09.2023)

---

## Schlüssel-Transkripte

### Teil 01 - Die Nötigung
> "Also ich, ja ich, ich wurde von meiner Anwältin **genötigt, die Beschwerde zurückzuziehen**."

### Teil 02 - Das Telefonat
> "Die Linné ruft gerade an und wollte noch zwei Punkte klären"
> "Ich habe jetzt keine Zeit, ich habe hier Fristen einzuhalten"
> "da müssen sie einen Termin machen. Ich habe schon dreimal Termin gemacht."
> "die hat das plötzlich fertig gehabt und hat das ans Oberlandesgericht..."
> "soll ich da jetzt nicht weiter dran rütteln und **die Beschwerde zurückziehen**"
> "ich hab gesagt, ist das dann Schuldeingeständnis? Das hat mit Schuld gar nichts zu tun."
> "Das Einzige, was sich ändert [...] das sind mehr Kosten."

### Teil 02 - Marks Frust
> "**Nichts hat sie gemacht.**"
> "**Gar nichts hat sie gemacht.**"
> "**Überhaupt nichts hat sie gemacht.**"

### Teil 02 - Die Robling-Verbindung
> "dem Robling, dem sage ich, dass er wegbleiben soll, sonst passiert was"
> "ne, ne, ne, das ist ja ein anderer Scheißanwalt, der das gemacht hat"

### Teil 03 - Marks Verzweiflung
> "Ich hab ein ganz schlechtes Gefühl."
> "Richtig schlechtes Gefühl."
> "Richtig, richtig schlechtes Gefühl."
> "Ich kann doch was zu sagen."
> "Ich mach nicht mehr lang. Ich mach nicht mehr lang. Ich kann nicht mehr."

### Teil 03 - Marks Theorie
> "die will mich loswerden, die denkt jetzt, ah gut, jetzt hat er zwei Jahre Kohle bezahlt, ok, jetzt brauche ich mir kein Mühen mehr zu geben"
> "ich sage ihm einfach, der soll das tun und dann läuft das gegen die Wand"
> "und dann hat er kein Geld mehr und, aber ich habe mir Geld gekriegt und scheiß drauf"

### Teil 04 - Der Betrug
> "Also für mich ist das so, dass ich hätte eigentlich im März gar nicht müssen zu ihr."
> "Die hat gesagt, wir müssen den Beschluss wegkriegen"
> "Damals war nie die Rede davon, ey der läuft im halben Jahr sowieso aus"
> "Nein, nein, nein, nein, **sie machen da nichts. Sie nehmen die Beschwerde zurück.**"

### Teil 05 - Rückblick
> "Vor einem Monat hast Du schon gesagt, ich hätte so gefroren, warum ich den Beschluss zurückziehen soll."
> "Und jetzt ist es mal genauso weit [...] ich raffe es nicht!"

---

## Bewertung der Audios

Diese Aufnahmen sind **KERNBEWEISE** für:
1. Nötigung zur Beschwerderücknahme
2. 2 Jahre Untätigkeit trotz Bezahlung
3. Lehnes Strategie: Geld kassieren, dann loswerden
4. Marks psychische Belastung durch die Situation

---

## SQL-Abfrage zum Abrufen

```sql
SELECT "snippetNumber", speaker, text
FROM "Snippet"
WHERE "audioId" IN (
  '2583ff89-9414-47d6-ab8f-48ceb88bdff1',
  '9ae5faa0-914b-4249-bcac-5fa89713aab6',
  '180f23b6-28c2-4327-9e4e-e0665648243a',
  '465a5f2d-d326-432d-85e6-d43d8fc5aec4',
  'e3b318bd-9fd4-49ee-a898-9fd296334918'
)
ORDER BY "audioId", "snippetNumber" ASC;
```
