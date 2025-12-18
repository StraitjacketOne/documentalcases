// ============================================
// LENA KUHN - VERBINDUNGSNETZ
// Erstellt: 2025-12-18
// Quelle: persons/Lena_Kuhn/05_verbindungen.md
// ============================================

// Zuerst alle loeschen (optional - auskommentieren wenn nicht gewuenscht)
// MATCH (n) DETACH DELETE n;

// ============================================
// PERSONEN - SOZIALER DIENST
// ============================================

CREATE (kuhn:Person:SozialerDienst {
    name: 'Lena Kuhn',
    role: 'Sachbearbeiterin Sozialer Dienst',
    institution: 'RVS',
    credibility: 2,
    manipulation: 'Sagte "Ich gehoere nicht zu denen" - LUEGE'
})

CREATE (bohnenberger:Person:SozialerDienst {
    name: 'Bohnenberger',
    role: 'Sozialer Dienst',
    institution: 'RVS'
})

// ============================================
// PERSONEN - JUGENDAMT (Verwaltung)
// ============================================

CREATE (schallenberg:Person:Jugendamt {
    name: 'Angelika Schallenberg',
    role: 'JA-Leitung',
    institution: 'RVS'
})

CREATE (brand:Person:Jugendamt {
    name: 'Beate Brand',
    role: 'Jugendamt',
    institution: 'RVS',
    note: 'Anzeige fuehrte zu Hausdurchsuchung'
})

CREATE (bluth:Person:Jugendamt {
    name: 'Heiko Bluth',
    role: 'Sachgebietsleiter',
    institution: 'RVS'
})

CREATE (meiser:Person:Jugendamt {
    name: 'Nina Meiser',
    role: 'Jugendamt (frueher)',
    institution: 'RVS'
})

// ============================================
// PERSONEN - JUSTIZ
// ============================================

CREATE (carius:Person:Justiz {
    name: 'Tom Carius',
    role: 'Staatsanwalt',
    institution: 'StA Saarbruecken'
})

CREATE (hellenthal:Person:Justiz {
    name: 'Richter Hellenthal',
    role: 'Familienrichter',
    institution: 'AG Saarbruecken'
})

// ============================================
// PERSONEN - PRAKSYS (Mutter & Tochter)
// ============================================

CREATE (rebecca:Person:PRAKSYS {
    name: 'Rebecca Wilhelm',
    role: 'Betreuerin',
    institution: 'PRAKSYS',
    family: 'Tochter von Susanne'
})

CREATE (susanne:Person:PRAKSYS {
    name: 'Susanne Wilhelm',
    role: 'Leitung PRAKSYS',
    institution: 'PRAKSYS',
    family: 'Mutter von Rebecca',
    note: 'Retroaktive Annotationen in Protokollen'
})

// ============================================
// PERSONEN - GESUNDHEITSAMT
// ============================================

CREATE (birk:Person:Gesundheitsamt {
    name: 'Alexander Birk',
    role: 'Medizinaldirektor',
    institution: 'Gesundheitsamt SB',
    note: 'Schrieb Paranoia-Diagnose nach 15min Gespraech'
})

CREATE (gestier:Person:Gesundheitsamt {
    name: 'Dr. Gestier-Fritz',
    role: 'Fachärztin Psychiatrie',
    institution: 'Gesundheitsamt SB'
})

CREATE (meiser_ga:Person:Gesundheitsamt {
    name: 'Birgit Meiser',
    role: 'Mitarbeiterin',
    institution: 'Gesundheitsamt SB',
    note: 'Bestaetigte: Kein Protokoll existiert'
})

// ============================================
// PERSONEN - BEREITSCHAFTSDIENST
// ============================================

CREATE (bereitschaft:Person:Bereitschaftsdienst {
    name: 'Bereitschaftsdienst (namenlos)',
    role: 'Bereitschaftsdienst',
    institution: 'RVS/DW Saar',
    email: 'bereitschaft-rvsb@dwsaar.de',
    taktik: '48-Stunden-Falle'
})

// ============================================
// INSTITUTIONEN
// ============================================

CREATE (praksys:Institution {
    name: 'PRAKSYS',
    type: 'Traeger',
    auftrag: 'Umgangsbegleitung'
})

CREATE (margaretenstift:Institution {
    name: 'Margaretenstift',
    type: 'Traeger',
    auftrag: 'Integrative Familienhilfe'
})

CREATE (ga:Institution {
    name: 'Gesundheitsamt SB',
    type: 'Behoerde'
})

// ============================================
// VERBINDUNGEN - KUHN ERTEILT AUFTRAEGE
// ============================================

CREATE (kuhn)-[:BEAUFTRAGT {
    art: 'Umgangsbegleitung',
    beleg: 'Audio 10.06.2024: Das ist der Auftrag von der Frau Kuhn',
    staerke: 'STARK'
}]->(praksys)

CREATE (kuhn)-[:BEAUFTRAGT {
    art: 'IF-Massnahme',
    beleg: 'IF-Bericht 26.06.2025'
}]->(margaretenstift)

CREATE (kuhn)-[:WEIST_AN]->(rebecca)
CREATE (kuhn)-[:WEIST_AN]->(susanne)

// ============================================
// VERBINDUNGEN - KUHN WIRD GESCHUETZT
// ============================================

CREATE (carius)-[:SCHUETZT {
    art: 'Verfahren eingestellt',
    datum: '11.08.2025',
    begruendung: 'Kein Anfangsverdacht',
    staerke: 'STARK'
}]->(kuhn)

CREATE (schallenberg)-[:SCHUETZT {
    art: 'Befangenheit abgelehnt',
    datum: '12.09.2025',
    staerke: 'MITTEL'
}]->(kuhn)

CREATE (hellenthal)-[:SCHUETZT {
    art: 'Antraege des Vaters abgelehnt',
    seit: '2022',
    staerke: 'STARK'
}]->(kuhn)

// ============================================
// VERBINDUNGEN - KUHN KOOPERIERT
// ============================================

CREATE (kuhn)-[:KOOPERIERT_MIT {
    art: 'Gemeinsame Noetigung',
    datum: '29.01.2025',
    beleg: 'Audio',
    staerke: 'STARK'
}]->(bohnenberger)

CREATE (kuhn)-[:KOOPERIERT_MIT {
    art: 'Koordination gegen Vater',
    note: 'Anzeige fuehrte zu Hausdurchsuchung'
}]->(brand)

CREATE (kuhn)-[:NUTZT {
    art: 'Abwimmeln des Vaters',
    beleg: 'Telefonat 24.09.2022'
}]->(bereitschaft)

// ============================================
// VERBINDUNGEN - KUHN BERICHTET AN
// ============================================

CREATE (kuhn)-[:BERICHTET_AN {
    art: 'Vorgesetzte'
}]->(schallenberg)

CREATE (kuhn)-[:BERICHTET_AN {
    art: 'Stellungnahmen ans Gericht',
    beleg: 'Falschaussage 11.05.2023',
    staerke: 'STARK'
}]->(hellenthal)

// ============================================
// VERBINDUNGEN - GESUNDHEITSAMT
// ============================================

CREATE (kuhn)-[:NUTZT_ALS_WERKZEUG {
    art: 'Pathologisierung',
    datum: '31.10.2023',
    note: '3 Tage vor OLG-Verhandlung vorgelegt'
}]->(ga)

CREATE (birk)-[:ARBEITET_FUER]->(ga)
CREATE (gestier)-[:ARBEITET_FUER]->(ga)
CREATE (meiser_ga)-[:ARBEITET_FUER]->(ga)

CREATE (birk)-[:ERSTELLTE_GUTACHTEN {
    diagnose: 'Paranoia querulans',
    grundlage: '15 Minuten Gespraech',
    datum: '09.01.2024'
}]->(kuhn)

// ============================================
// VERBINDUNGEN - PRAKSYS INTERN
// ============================================

CREATE (rebecca)-[:ARBEITET_FUER]->(praksys)
CREATE (susanne)-[:LEITET]->(praksys)
CREATE (susanne)-[:MUTTER_VON]->(rebecca)

// ============================================
// VERBINDUNGEN - HIERARCHIE
// ============================================

CREATE (schallenberg)-[:VORGESETZTE_VON]->(brand)
CREATE (schallenberg)-[:VORGESETZTE_VON]->(bluth)
CREATE (bluth)-[:VORGESETZTER_VON]->(meiser)

// ============================================
// QUERIES ZUM TESTEN
// ============================================

// Alle Verbindungen von Kuhn:
// MATCH (kuhn:Person {name: 'Lena Kuhn'})-[r]-(other) RETURN kuhn, r, other

// Wer schuetzt Kuhn:
// MATCH (protector)-[:SCHUETZT]->(kuhn:Person {name: 'Lena Kuhn'}) RETURN protector, kuhn

// Komplettes Netzwerk:
// MATCH (n)-[r]->(m) RETURN n, r, m
