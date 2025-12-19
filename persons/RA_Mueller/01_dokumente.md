# RA Müller - Dokumente

**Erstellt:** 2025-12-17

---

## Bekannte Dokumente

| Typ | Status | Beschreibung |
|-----|--------|--------------|
| Rechnung(en) | Zu suchen | 2 Verfahren voll abgerechnet, ca. 900€ |
| Mahnung | Zu suchen | Wurde von Mark bezahlt |
| Brief | Zu suchen | Die einzige tatsächliche Leistung |

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

- [ ] **MARK LIEFERT NACH**: Rechnung(en) aus Schlafzimmer holen (Katze schläft)
- [ ] Prüfen ob Abrechnung RVG-konform war
- [ ] Mahnung dokumentieren
- [ ] Zahlungsnachweis (falls vorhanden)

**ACHTUNG VERJÄHRUNG: 31.12.2025 - nur noch ~2 Wochen!**
