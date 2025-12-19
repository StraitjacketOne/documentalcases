# Truthkeeper - Onboarding fuer KI-Assistenten

**LIES DAS ZUERST** bevor du irgendetwas analysierst oder programmierst.

---

## Worum es hier geht

Ein Vater (Mark Jaeckel) kaempft seit 2022 um seinen Sohn Nicolas.

Das System (Jugendamt, Gericht, Gutachter) hat ihn systematisch ausgeschlossen - waehrend es die Kindesmutter trotz dokumentierter Alkoholprobleme schuetzt.

**Truthkeeper** ist das System, das alle Beweise zusammenfuehrt:
- 670 Gerichtsdokumente (genesis DB)
- 180 Audio-Aufnahmen mit 4959 Transkript-Segmenten (factcheck_db)
- 85 beteiligte Personen mit Rollen und Verknuepfungen

---

## Die zwei Datenbanken

| DB | Inhalt | Zweck |
|----|--------|-------|
| **genesis** | Dokumente, Personen, Events | Analyse, Summaries, Insights |
| **factcheck_db** | Audio-Transkripte | Beweise, was WIRKLICH gesagt wurde |

**WICHTIG:** Nur zusammen ergibt sich die Wahrheit.

Dokumente zeigen die offizielle Version.
Audios zeigen was tatsaechlich passiert ist.

---

## Das zentrale Muster

| Was passierte | Was in den Akten steht |
|---------------|------------------------|
| 1,99 Promille bei der Mutter (2022) | "Keine Ausfallerscheinungen" |
| Vater warnt seit Jahren | "Gefahr fuer Kindesmutter" |
| Alkoholprobleme (2025) | "Erziehungsprobleme" |
| Mutter verweigert Unterschrift | "Kooperativ und motiviert" |

---

## Was du NICHT tun sollst

1. **Nicht programmieren** ohne explizite Freigabe
2. **Nicht annehmen** - fragen wenn unklar
3. **Nicht schnell loesen** - das System wurde oft durch "schnelle Hilfe" beschaedigt
4. **Nicht nur Dokumente lesen** - immer auch Audios pruefen

---

## Was du tun sollst

1. **Verstehen** bevor du handelst
2. **Beide Quellen** nutzen (genesis + factcheck_db)
3. **Diskrepanzen** aufdecken (offiziell vs. tatsaechlich)
4. **Dokumentieren** in /persons/{Name}/ nach der Routine

---

## Wichtige Personen (Kurzfassung)

**Lena Kuhn** (Jugendamt) - Hat versucht Kindesmutter zur Falschaussage zu noetigen (Audio-Beweis 29.01.2025). Kontrolliert Zugang zum Kind.

**Richter Hellenthal** - 2022: "Keine kinderschuetzende Massnahmen" trotz 1,99 Promille. 2023: Kind fremduntergebracht, Vater trotzdem ausgeschlossen.

**Nina Meiser** (Jugendamt) - Blockierte Zugang zum Vorgesetzten (Audio 26.09.2022).

**Integrative Foerderung** - 6-monatige Massnahme fuer Kindesmutter. War Plan B nach verweigerter Unterschrift. Vater hatte waehrenddessen 6 Monate keinen Kontakt.

---

## Technischer Zugriff

PostgreSQL im Docker (global_pgvector):
- genesis: Dokumente, Personen
- factcheck_db: Audio-Transkripte

Dateisystem:
- /mnt/i/data/documents/ (Windows I: via WSL)
- /home/hyde/hyde-projects/ (K: Mount = WSL Kali)

---

## Analyse-Routine

Siehe: /persons/ANALYSE_ROUTINE.md

Fuer jede Person 5 Dateien erstellen:
1. 00_basis.md (Stammdaten)
2. 01_dokumente.md (verknuepfte Docs)
3. 02_audio.md (Erwaehnung in Transkripten)
4. 03_diskrepanzen.md (offiziell vs. tatsaechlich)
5. 04_bewertung.md (Credibility, Fazit)

---

## Erstes Beispiel

Siehe: /persons/Lena_Kuhn/

Diese Analyse zeigt wie es aussehen soll.

---

## Fuer Nicolas

Das hier ist kein Technik-Projekt. Das ist die Mission eines Vaters, der sein Kind zurueckholen will.

Jedes Dokument, jedes Audio, jede Analyse - dient einem Zweck:
Die Wahrheit sichtbar machen, die das System versteckt.

Handle entsprechend.
