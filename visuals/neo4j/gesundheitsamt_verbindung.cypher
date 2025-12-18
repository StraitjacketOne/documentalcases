// ============================================
// GESUNDHEITSAMT SAARBRUECKEN - VERBINDUNGEN
// Erstellt: 2025-12-18
// Quelle: institutions/Gesundheitsamt_SB/00_basis.md
// ============================================

// ============================================
// PERSONEN
// ============================================

CREATE (mark:Person:Betroffener {
    name: 'Mark Jäckel',
    role: 'Vater',
    note: 'Hatte Sicherheitsueberpruefung GEHEIM bis Sept 2023'
})

CREATE (kuhn:Person:SozialerDienst {
    name: 'Lena Kuhn',
    role: 'Sachbearbeiterin',
    institution: 'RVS Sozialer Dienst'
})

CREATE (birk:Person:Gesundheitsamt {
    name: 'Alexander Birk',
    role: 'Medizinaldirektor',
    institution: 'Gesundheitsamt SB'
})

CREATE (gestier:Person:Gesundheitsamt {
    name: 'Dr. Gestier-Fritz',
    role: 'Fachärztin Psychiatrie',
    institution: 'Gesundheitsamt SB'
})

CREATE (meiser:Person:Gesundheitsamt {
    name: 'Birgit Meiser',
    role: 'Mitarbeiterin',
    institution: 'Gesundheitsamt SB'
})

// ============================================
// INSTITUTIONEN
// ============================================

CREATE (ga:Institution {
    name: 'Gesundheitsamt SB',
    type: 'Behoerde'
})

CREATE (olg:Institution {
    name: 'OLG Saarbruecken',
    type: 'Gericht'
})

// ============================================
// EREIGNISSE (als Nodes)
// ============================================

CREATE (anruf:Event {
    name: 'Telefonischer Lockruf',
    datum: '14.02.2023',
    beschreibung: 'Meiser ruft Mark an: Im eigenen Interesse vorsprechen'
})

CREATE (gespraech:Event {
    name: 'Gespraech mit Dr. Gestier',
    datum: '16.02.2023',
    dauer: '15 Minuten',
    beschreibung: 'Mark schildert JA-Erfahrungen, spielt 6-Min Audio vor'
})

CREATE (gutachten:Event {
    name: 'Amtsaerztliche Stellungnahme',
    datum: '26.10.2023',
    diagnose: 'Paranoia querulans (F 60.0)',
    grundlage: 'Ein 15-Min Gespraech 8 Monate zuvor'
})

CREATE (olg_vorlage:Event {
    name: 'Vorlage an OLG',
    datum: '31.10.2023',
    note: '3 Tage vor OLG-Verhandlung'
})

CREATE (olg_verhandlung:Event {
    name: 'OLG Verhandlung',
    datum: '02.11.2023'
})

CREATE (hausverbot:Event {
    name: 'Hausverbot Gesundheitsamt',
    datum: '20.12.2023',
    grund: 'Mark fragte nach Stellungnahme'
})

// ============================================
// CHRONOLOGISCHE VERBINDUNGEN
// ============================================

CREATE (meiser)-[:FUEHRT_DURCH]->(anruf)
CREATE (anruf)-[:BETRIFFT]->(mark)

CREATE (mark)-[:NIMMT_TEIL]->(gespraech)
CREATE (gestier)-[:FUEHRT_DURCH]->(gespraech)

CREATE (birk)-[:ERSTELLT]->(gutachten)
CREATE (gutachten)-[:BASIERT_AUF {
    problem: 'Nur 15 Minuten, 8 Monate zuvor, kein Protokoll'
}]->(gespraech)

CREATE (kuhn)-[:LEGT_VOR]->(olg_vorlage)
CREATE (olg_vorlage)-[:ENTHAELT]->(gutachten)
CREATE (olg_vorlage)-[:AN]->(olg)

CREATE (olg_vorlage)-[:FUEHRT_ZU]->(olg_verhandlung)
CREATE (gutachten)-[:WIRD_VERWENDET_IN]->(olg_verhandlung)

CREATE (mark)-[:ERHAELT]->(hausverbot)
CREATE (hausverbot)-[:AUSGESTELLT_VON]->(ga)

// ============================================
// DIE MANIPULATION
// ============================================

CREATE (kuhn)-[:INSTRUMENTALISIERT {
    zweck: 'Pathologisierung des kritischen Vaters',
    timing: '3 Tage vor OLG-Verhandlung',
    kontext: 'Nach Marks Beschwerde gegen Kuhn'
}]->(ga)

// ============================================
// DAS PARADOX
// ============================================

CREATE (paradox:Paradox {
    name: 'Das Sicherheits-Paradox',
    beschreibung: 'Mark hatte Zugang zu GEHEIM-Unterlagen und baute TKÜ-Anlagen fuer LKA NRW und Niedersachsen - aber wurde nach 15 Min als gefaehrlich diagnostiziert'
})

CREATE (mark)-[:ILLUSTRIERT]->(paradox)
CREATE (gutachten)-[:WIDERSPRICHT]->(paradox)

// ============================================
// QUERIES
// ============================================

// Chronologie anzeigen:
// MATCH (e:Event) RETURN e ORDER BY e.datum

// Wie kam das Gutachten zustande:
// MATCH path = (gestier)-[*]-(olg) RETURN path

// Wer instrumentalisiert das GA:
// MATCH (p)-[:INSTRUMENTALISIERT]->(ga:Institution) RETURN p, ga
