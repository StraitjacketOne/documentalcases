# RA Müller - Dokumente

**Erstellt:** 2025-12-17

---

## Bekannte Dokumente

| Typ | Status | Beschreibung |
|-----|--------|--------------|
| Rechnung(en) | Gefunden | 2022-08-05_RA_Müller_Rechnung.txt (Leistungszeit 31.05.–05.08.2022, Rechnung Nr. 2200893) |
| Mahnung | Nicht gefunden | Keine Mahnung in extracted/, evidence/ oder anderen Ablagen auffindbar |
| Brief | Offen | Noch nicht ausgewertet; separate Suche erforderlich |

---

## Suche in Datenbanken

### extracted-Ordner
```
Glob: extracted/*Müller* oder extracted/*Mueller*
```

### genesis-DB
```sql
SELECT * FROM documents WHERE text_content ILIKE '%müller%' OR title ILIKE '%müller%';
```

### factcheck_db
```sql
SELECT * FROM "AudioFile" WHERE filename ILIKE '%müller%';
```

---

## TODO

- [x] **MARK LIEFERT NACH**: Rechnung(en) aus Schlafzimmer holen (Katze schläft) → Rechnung 2200893 im extracted-Ordner gesichert
- [x] Prüfen ob Abrechnung RVG-konform war → Ansatz der VV 4100 (220,00 €) und VV 4104 (181,50 €) sowie Auslagenpauschale 7002 (20,00 €) entspricht den Regelgebühren, MwSt. 19 % berechnet; Guthaben von 132,77 € abgezogen
- [x] Mahnung dokumentieren → Keine Mahnung vorhanden; weiterer Nachweis erforderlich, falls sie noch zugestellt wird
- [ ] Zahlungsnachweis (falls vorhanden) → Bisher kein Zahlungsbeleg gefunden; Suche in persönlichen Unterlagen oder Bankbewegungen nötig

**ACHTUNG VERJÄHRUNG: 31.12.2025 - nur noch ~2 Wochen!**

---

## Ergebnisse

- **Rechnungen:** Scan der Rechnung Nr. 2200893 vom 05.08.2022 (Leistungszeit 31.05.–05.08.2022) liegt in `extracted/2022-08-05_RA_Müller_Rechnung.txt` vor. Positionen: VV 4100 (220,00 €), VV 4104 (181,50 €), Nr. 7002 (20,00 €), MwSt. 19 %, Abzug Guthaben 132,77 € → Rechnungssumme 501,59 € brutto.
- **RVG-Konformität:** Gebührentatbestände und Beträge entsprechen den Regelgebühren des VV RVG für Ermittlungsverfahren; keine offensichtlichen Überhöhungen festgestellt.
- **Mahnung:** Trotz Durchsicht von `extracted/`, `evidence/` und `persons/` keine Mahnung auffindbar. Falls eine Mahnung existiert, sollte sie nachgereicht werden.
- **Zahlungsnachweis:** Kein Beleg in den vorhandenen Ablagen gefunden. Nächster Schritt: Kontoauszüge oder E-Mail-Bestätigungen durchsuchen.
- **Frist:** Verjährungsfrist 31.12.2025 bleibt unverändert im Kalender halten.
