# Truthkeeper: Audio-Integration in Genesis

**Datum:** 2025-12-15
**Status:** Verständnisdokumentation - KEINE Implementierung
**Autor:** Claude (Session mit Mark)

---

## Was ich verstanden habe

### Die zwei Datenbanken

| Datenbank | Inhalt | Anzahl |
|-----------|--------|--------|
| **genesis** | Gerichtsdokumente mit summary + claude_insights | 670 Dokumente |
| **factcheck_db** | Audio-Transkripte als Snippets | 180 Audios, 4959 Snippets |

### Das Problem

- In **genesis** sind nur **5 Transkripte** als vollständige Dokumente mit Summary/Insights
- In **factcheck_db** liegen **175 weitere Audio-Transkripte** - aber ohne Summary/Insights
- Bei einer Analyse (z.B. "Meiser verweigert Zugang zu Vorgesetztem") werden die Audios nicht gefunden, weil sie nicht in genesis sind

### Was funktioniert (und NICHT kaputt gemacht werden darf)

1. **genesis.documents** - Struktur mit:
   - text_content (Volltext)
   - summary (Zusammenfassung)
   - claude_insights (juristische Analyse)
   - date, title, document_type, etc.

2. **factcheck_db** - Prisma-Schema mit:
   - AudioFile (Metadaten, Status, eventDate)
   - Snippet (Transkript-Segmente mit Timestamps, Speaker, Review-Status)
   - Evidence (Export-Marker)

3. **Die 5 bereits integrierten Transkripte** zeigen wie es aussehen soll:
   - z.B. 2022-12-13_RVS-JA_Kuhn-Jäckel_Telefonat-Umgangsverfahren-Volltranskript
   - 18.892 Zeichen text_content
   - Summary erfasst Kernpunkte
   - Insights erfassen juristische Schwachstellen

### Was gebraucht wird

Ein Weg, die **175 fehlenden Transkripte** in genesis zu bringen:
- Snippets zu einem Volltext zusammenfügen
- Summary generieren (wie bei den 5 existierenden)
- claude_insights generieren
- Als Dokument in genesis einfügen
- **OHNE** factcheck_db zu verändern
- **OHNE** die bestehende genesis-Struktur zu brechen

### Warum das wichtig ist

Bei der Analyse "Nina Meiser verweigerte Zugang zum Vorgesetzten" habe ich gefunden:

**Aus genesis (Dokumente):**
- Melissengeist-Bagatellisierung durch Verfahrensbeiständin

**Aus factcheck_db (Audio):**
- Das Telefonat vom 26.09.2022 wo Meiser sagt "Nö, es gibt keinen Vertreter"

Ohne die Audios in genesis fehlt die Hälfte der Beweislage.

---

## Was ich NICHT tun werde

- Keine Strukturänderungen an genesis
- Keine Änderungen an factcheck_db/Prisma
- Keine "schnelle Lösung" die bestehende Daten überschreibt
- Keine Annahmen über Feldnamen oder Typen ohne Absprache

---

## Nächste Schritte (nach Freigabe)

1. **Analyse:** Welche der 175 Audios haben vollständige Transkripte (status=completed)?
2. **Test:** Ein einzelnes Audio manuell in genesis einfügen (wie die 5 existierenden)
3. **Validierung:** Prüfen ob es bei Suchen gefunden wird
4. **Erst dann:** Über Automatisierung nachdenken

---

## Offene Fragen

- Wie wurden die 5 existierenden Transkripte in genesis eingefügt? (Script? Manuell?)
- Soll document_type für Audios anders sein als für Gerichtsdokumente?
- Sollen Audios mit Dokumenten verknüpft werden können (z.B. Audio vom 26.09. verlinkt zu Stellungnahme vom 05.10.)?

---

## Update: Antworten auf offene Fragen (15.12.2025)

### Wie kamen die 5 Transkripte in genesis?

Pragmatischer Weg:
- Transkript von TurboScribe als TXT erhalten
- TXT zu PDF konvertiert
- Titel enthält die Metadaten (Datum, Beteiligte, Thema)
- Kein automatisierter Prozess - manuell eingepflegt

### Warum nur 5 von 180?

**Kritischer Punkt: Sprecherzuordnung**

Whisper (und andere Transkriptions-Tools) können Sprecher verwechseln. Wenn "VATER" und "MUTTER" vertauscht werden, wird aus einer Entlastung eine Belastung.

Beispiel: Kindesmutter sagt betrunken etwas Belastendes → Whisper ordnet es dem Vater zu → Analyse sieht "Beweis" gegen den Vater.

**Deswegen existiert der FactCheck-Review-Workflow:**
- Jedes Snippet muss manuell geprüft werden
- Sprecher müssen verifiziert werden
- Erst nach Review ist ein Transkript "gerichtsfest"

**Aktueller Stand:**
- 180 Audio-Dateien transkribiert
- Nur 3-4 davon vollständig reviewed
- Nur diese gehören in eine Analyse

### Konsequenz für die Integration

Es dürfen **NUR reviewed Transkripte** in genesis:
- factcheck_db.Snippet.reviewed = true für ALLE Snippets eines Audios
- Oder: Eine manuelle Freigabe-Liste

Ein automatischer Import aller 175 wäre **gefährlich** - er würde ungeprüfte Daten in die Analyse-Pipeline bringen.

---

## Der eigentliche Schmerz

> "Wenn die Kindesmutter besoffen anruft, ich mein Kind im Hintergrund weinen höre, und gleichzeitig keine Möglichkeit habe die Polizei zu rufen - weil die wimmelt mich ab, weil sie vom Jugendamt gehört haben, dass ich ein schlechter Mensch sei."

Das System Truthkeeper existiert, weil niemand zuhört. Die Beweise existieren - auf Band, in Dokumenten, in Polizeiberichten. Aber sie werden nicht zusammengeführt. Jede Behörde sieht nur ihren Ausschnitt.

Genesis + FactCheck zusammen sollen das ändern: Alle Beweise, durchsuchbar, analysierbar, mit Kontext.

Für Nicolas. Und für alle Väter denen es genauso geht.

---

## Analyse-Beispiel: Hellenthal-Entscheidungen (Test vom 15.12.2025)

### Testfrage: Womit begründet Richter Hellenthal, dass die Kindesmutter keine Einschränkung im Sorgerecht hat?

### Gefunden in genesis (Dokumente):

**25.10.2022 - Protokoll Erörterungstermin (39 F 221/22 EASO):**

Kindesmutter gibt zu Protokoll:
> "Nur einmal habe sie getrunken gehabt. Das sei die Situation gewesen, bei der ein Atemalkoholgehalt von **1,99 %** festgestellt worden sei."

Jugendamt (Bluth):
> "Bei einer dieser Situationen sei die Kindesmutter alkoholisiert angetroffen worden mit einem hohen Alkoholgehalt, sie habe allerdings **keinerlei Ausfallerscheinungen in Bezug auf ihre Fähigkeit, das Kind zu versorgen** gezeigt."

Beschluss Hellenthal:
> "Das Gericht führt aus, dass es unter diesen Bedingungen aktuell **das Verfahren ohne weitere kinderschützende Maßnahmen einstellen** will."

### Ein Jahr später - 14.09.2023:

Nicolas ist jetzt in einer **Wohngruppe (Margaretenstift)** - fremduntergebracht.

Jugendamt zur Frage, warum der Vater nicht in Betracht gezogen wurde:
> "Es wird darauf Bezug genommen, dass das Verhältnis zwischen den Kindeseltern hochbelastet gewesen sei. Es habe außerdem bereits lange Zeit nach den Akten des Jugendamts keinen Umgang mehr gegeben. Es seien zudem **manipulierende Verhaltensweisen** durch die umgangsbegleitenden Träger vom Kindesvater berichtet worden. Hier wird Bezug genommen auf die Aussagen: **'ich vermisse dich, die Katze vermisst dich auch'**"

### Das Muster:

| Datum | Situation | Entscheidung |
|-------|-----------|--------------|
| 2022 | Mutter mit 1,99 Promille beim Kind | "Keine kinderschützende Maßnahmen" |
| 2023 | Kind in Fremdunterbringung | Vater "nicht in Betracht gezogen" |

Die Begründung ändert sich. Das Ergebnis bleibt gleich.

### Was die Audio-Beweise zusätzlich zeigen würden:

- 26.09.2022: Meiser blockiert Zugang zum Vorgesetzten
- 24.09.2022: JA-Bereitschaft "leugnet Dringlichkeit" trotz Meldung
- 31.08.2022: Polizei Burbach dokumentiert "besoffene Sprachnachrichten"
- Dutzende weitere Meldungen, die im System versickert sind

**Ohne die Audios fehlt der Beweis, dass der Vater gewarnt hat - und systematisch ignoriert wurde.**
