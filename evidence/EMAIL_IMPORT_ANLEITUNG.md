# Email-Import Anleitung für Claude Sessions

## Voraussetzungen
- Zapier MCP muss in der Session aktiv sein
- Zugriff auf I:/base/rag

## Schritt 1: Emails suchen

Nutze `mcp__zapier__microsoft_outlook_api_request_beta`:

```
method: GET
url: https://graph.microsoft.com/v1.0/me/messages?$search="from:EMAILADRESSE"&$top=50
```

Für gesendete Emails:
```
url: https://graph.microsoft.com/v1.0/me/messages?$search="to:EMAILADRESSE"&$top=50
```

## Schritt 2: Vollständige Email-Daten holen

Für jede Email die Message-ID nehmen und abrufen:
```
method: GET
url: https://graph.microsoft.com/v1.0/me/messages/MESSAGE_ID
```

## Schritt 3: Import ausführen

```python
cd I:/base/rag && python -c "
import sys
sys.path.append('.')
from cli.commands.email_import import EmailImportCommand

email_data = {
    'id': 'MESSAGE_ID',
    'internetMessageId': 'INTERNET_MESSAGE_ID',
    'subject': 'BETREFF',
    'sentDateTime': '2024-01-01T10:00:00Z',
    'hasAttachments': False,
    'importance': 'normal',
    'from': {'name': 'Absender Name', 'address': 'absender@example.com'},
    'toRecipients': [{'name': 'Empfänger Name', 'address': 'empfaenger@example.com'}],
    'ccRecipients': [],
    'body': {'contentType': 'text', 'content': 'EMAIL INHALT HIER'}
}

cmd = EmailImportCommand()
result = cmd.process_email(email_data, auto_confirm=True)
print(f'Importiert: {result}')
"
```

## Batch-Import (mehrere Emails)

```python
emails = [
    { ... email1 ... },
    { ... email2 ... },
]

cmd = EmailImportCommand()
for email in emails:
    cmd.process_email(email, auto_confirm=True)
```

## Speicherorte

| Was | Pfad |
|-----|------|
| Forensische .eml Dateien | `I:/data/documents/evidence/raw/` |
| Import-Log (JSON) | `I:/data/documents/log/email_log.json` |
| PostgreSQL DB | `genesis` |
| Qdrant Collection | `genesis_vectors` |

## Bereits importierte Absender

- Karin Berg (karin.berg@rvsbr.de) - VON und AN - 19 Emails

## Wichtige Hinweise

1. Duplikat-Check erfolgt automatisch über `internetMessageId`
2. SHA256-Hash wird für forensische Integrität gespeichert
3. Emails werden in Chunks aufgeteilt und in Qdrant embedded

## CLI Stats prüfen

```bash
cd I:/base/rag && python cli/main.py email stats
```
