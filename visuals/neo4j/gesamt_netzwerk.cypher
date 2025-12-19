// ============================================
// DOKUMENTALCASES - GESAMT-NETZWERK
// Erstellt: 2025-12-18
// Master-File mit allen Akteuren und Verbindungen
// ============================================

// ACHTUNG: Dieses File erstellt das komplette Netzwerk.
// Zuerst Datenbank leeren (auskommentieren wenn nicht gewuenscht):
// MATCH (n) DETACH DELETE n;

// ============================================
// ZENTRALE FIGUREN
// ============================================

CREATE (mark:Person:Betroffener {
    name: 'Mark Jäckel',
    role: 'Vater',
    sicherheit: 'Sicherheitsueberpruefung GEHEIM bis Sept 2023',
    arbeit: 'TKÜ-Anlagen LKA NRW, LKA Niedersachsen',
    status: 'Alle Rechte entzogen trotz keiner Verurteilung'
})

CREATE (aleksandra:Person:Hauptperson {
    name: 'Aleksandra Kasprzak',
    role: 'Kindesmutter',
    problem: 'Dokumentierter Alkoholismus seit 2021',
    vorfall_1: '9300 EUR Diebstahl vom Vater',
    vorfall_2: 'Flucht nach Polen mit Kind',
    muster: 'Absturz → Intervention → Erfolg → Wiederholung → Vertuschung',
    schutz: 'Wird vom System systematisch geschuetzt'
})

CREATE (kind:Person:Kind {
    name: 'Kind',
    note: 'Geschuetztes Opfer des Systems',
    betreut_seit: '2022'
})

// ============================================
// SOZIALER DIENST
// ============================================

CREATE (kuhn:Person:SozialerDienst {
    name: 'Lena Kuhn',
    role: 'Sachbearbeiterin Sozialer Dienst',
    institution: 'RVS',
    credibility: 2,
    manipulation: 'Sagte "Ich gehoere nicht zu denen" - erschlich Vertrauen',
    methode: 'Falschaussagen vor Gericht, Timing strategisch'
})

CREATE (bohnenberger:Person:SozialerDienst {
    name: 'Bohnenberger',
    role: 'Sozialer Dienst',
    institution: 'RVS'
})

// ============================================
// JUGENDAMT (Verwaltung - separate Abteilung!)
// ============================================

CREATE (schallenberg:Person:Jugendamt {
    name: 'Angelika Schallenberg',
    role: 'Jugendamtsleitung',
    institution: 'RVS'
})

CREATE (brand:Person:Jugendamt {
    name: 'Beate Brand',
    role: 'Jugendamt',
    institution: 'RVS',
    aktion: 'Anzeige fuehrte zu Hausdurchsuchung'
})

CREATE (bluth:Person:Jugendamt {
    name: 'Heiko Bluth',
    role: 'Sachgebietsleiter',
    institution: 'RVS'
})

CREATE (meiser_ja:Person:Jugendamt {
    name: 'Nina Meiser',
    role: 'Jugendamt (frueher)',
    institution: 'RVS'
})

// ============================================
// BEREITSCHAFTSDIENST
// ============================================

CREATE (bereitschaft:Person:Bereitschaftsdienst {
    name: 'Bereitschaftsdienst (namenlos)',
    role: 'Bereitschaftsdienst',
    institution: 'RVS/DW Saar',
    email: 'bereitschaft-rvsb@dwsaar.de',
    taktik: '48-Stunden-Falle: Rufen Sie die Polizei → Niemand handelt',
    zitat: 'Es vergeht kein Wochenende, wo mir die Kollegin nicht erzaehlt, dass Sie anrufen'
})

// ============================================
// GERICHTE
// ============================================

CREATE (hellenthal:Person:Richter {
    name: 'Richter Hellenthal',
    role: 'Familienrichter',
    institution: 'AG Saarbruecken',
    muster: 'Lehnt systematisch Vater-Antraege ab seit 2022'
})

CREATE (olg:Institution:Gericht {
    name: 'OLG Saarbruecken',
    type: 'Oberlandesgericht'
})

CREATE (ag:Institution:Gericht {
    name: 'AG Saarbruecken',
    type: 'Amtsgericht'
})

// ============================================
// STAATSANWALTSCHAFT
// ============================================

CREATE (carius:Person:Staatsanwalt {
    name: 'Tom Carius',
    role: 'Staatsanwalt',
    institution: 'StA Saarbruecken',
    aktion: '11.08.2025 Einstellung: Kein Anfangsverdacht'
})

// ============================================
// PRAKSYS (Mutter & Tochter!)
// ============================================

CREATE (praksys:Institution:Traeger {
    name: 'PRAKSYS',
    type: 'Traeger fuer Umgangsbegleitung',
    problem: 'Familienbetrieb - Mutter und Tochter',
    methode: 'Retroaktive Annotationen, negative Berichte auf Kuhns Auftrag'
})

CREATE (rebecca:Person:PRAKSYS {
    name: 'Rebecca Wilhelm',
    role: 'Betreuerin',
    institution: 'PRAKSYS',
    family: 'TOCHTER von Susanne'
})

CREATE (susanne:Person:PRAKSYS {
    name: 'Susanne Wilhelm',
    role: 'Leitung PRAKSYS',
    institution: 'PRAKSYS',
    family: 'MUTTER von Rebecca'
})

// ============================================
// MARGARETENSTIFT
// ============================================

CREATE (margaretenstift:Institution:Traeger {
    name: 'Margaretenstift',
    type: 'Integrative Familienhilfe',
    traeger: 'Caritas'
})

// ============================================
// GESUNDHEITSAMT
// ============================================

CREATE (ga:Institution:Behoerde {
    name: 'Gesundheitsamt Saarbruecken',
    type: 'Behoerde',
    missbrauch: 'Instrumentalisiert zur Pathologisierung'
})

CREATE (birk:Person:Gesundheitsamt {
    name: 'Alexander Birk',
    role: 'Medizinaldirektor',
    institution: 'Gesundheitsamt SB',
    diagnose: 'Paranoia querulans nach 15min'
})

CREATE (gestier:Person:Gesundheitsamt {
    name: 'Dr. Gestier-Fritz',
    role: 'Fachärztin Psychiatrie',
    institution: 'Gesundheitsamt SB',
    kontakt: '16.02.2023, 15 Minuten, keine Untersuchung'
})

CREATE (meiser_ga:Person:Gesundheitsamt {
    name: 'Birgit Meiser',
    role: 'Mitarbeiterin',
    institution: 'Gesundheitsamt SB',
    aussage: 'Bestaetigte: Es gibt kein Protokoll'
})

// ============================================
// RECHTSANWAELTE (Vater)
// ============================================

CREATE (mueller:Person:Anwalt {
    name: 'RA Müller',
    role: 'Rechtsanwalt (frueher)',
    note: 'Fruehere Vertretung Mark'
})

CREATE (lehne:Person:Anwalt {
    name: 'RA Dr. Lehne',
    role: 'Rechtsanwalt (frueher)'
})

CREATE (robling:Person:Anwalt {
    name: 'RA Röbling',
    role: 'Rechtsanwalt (frueher)'
})

// ============================================
// FAMILIENBEZIEHUNGEN
// ============================================

CREATE (mark)-[:VATER_VON]->(kind)
CREATE (aleksandra)-[:MUTTER_VON]->(kind)
CREATE (susanne)-[:MUTTER_VON]->(rebecca)

// ============================================
// MARK VS. SYSTEM
// ============================================

CREATE (mark)-[:KAEMPFT_UM]->(kind)
CREATE (aleksandra)-[:HAT_SORGERECHT]->(kind)

CREATE (mark)-[:GESCHAEDIGT_DURCH {
    art: 'Falschaussagen, Pathologisierung, Rechte entzogen',
    zeitraum: '2022-2025'
}]->(kuhn)

CREATE (mark)-[:GESCHAEDIGT_DURCH {
    art: 'Diagnose ohne Untersuchung',
    datum: '26.10.2023'
}]->(birk)

CREATE (mark)-[:ABGEWIESEN_VON {
    methode: '48-Stunden-Falle',
    beleg: 'Email 31.08.2022, Telefonat 24.09.2022'
}]->(bereitschaft)

// ============================================
// KUHN NETZWERK - AUFTRAEGE
// ============================================

CREATE (kuhn)-[:BEAUFTRAGT {
    art: 'Umgangsbegleitung',
    beleg: 'Audio 10.06.2024: Das ist der Auftrag von der Frau Kuhn'
}]->(praksys)

CREATE (kuhn)-[:BEAUFTRAGT {
    art: 'IF-Massnahme',
    beleg: 'IF-Bericht 26.06.2025'
}]->(margaretenstift)

CREATE (kuhn)-[:WEIST_AN {
    inhalt: 'Negative Berichte schreiben'
}]->(rebecca)

// ============================================
// KUHN NETZWERK - SCHUTZ
// ============================================

CREATE (carius)-[:SCHUETZT {
    art: 'Verfahren eingestellt',
    datum: '11.08.2025',
    begruendung: 'Kein Anfangsverdacht'
}]->(kuhn)

CREATE (schallenberg)-[:SCHUETZT {
    art: 'Befangenheit abgelehnt',
    datum: '12.09.2025'
}]->(kuhn)

CREATE (hellenthal)-[:SCHUETZT {
    art: 'Vater-Antraege abgelehnt',
    seit: '2022'
}]->(kuhn)

// ============================================
// KUHN NETZWERK - KOOPERATION
// ============================================

CREATE (kuhn)-[:KOOPERIERT_MIT {
    art: 'Gemeinsame Noetigung',
    datum: '29.01.2025',
    beleg: 'Audio'
}]->(bohnenberger)

CREATE (kuhn)-[:KOOPERIERT_MIT {
    art: 'Koordination',
    ergebnis: 'Hausdurchsuchung beim Vater'
}]->(brand)

CREATE (kuhn)-[:NUTZT {
    art: 'Pathologisierung des Vaters',
    timing: '3 Tage vor OLG-Verhandlung'
}]->(ga)

// ============================================
// KUHN NETZWERK - HIERARCHIE
// ============================================

CREATE (kuhn)-[:BERICHTET_AN]->(schallenberg)
CREATE (kuhn)-[:BERICHTET_AN {
    art: 'Stellungnahmen',
    problem: 'Falschaussage 11.05.2023'
}]->(hellenthal)

// ============================================
// GESUNDHEITSAMT KETTE
// ============================================

CREATE (meiser_ga)-[:LOCKT_AN {
    datum: '14.02.2023',
    aussage: 'Im eigenen Interesse vorsprechen'
}]->(mark)

CREATE (gestier)-[:FUEHRT_GESPRAECH {
    datum: '16.02.2023',
    dauer: '15 Minuten',
    inhalt: 'Mark schildert JA-Erfahrungen, spielt Audio vor',
    ergebnis: 'Keine Untersuchung, kein Protokoll'
}]->(mark)

CREATE (birk)-[:ERSTELLT_GUTACHTEN {
    datum: '26.10.2023',
    diagnose: 'Paranoia querulans F60.0',
    grundlage: 'Ein 15min Gespraech 8 Monate zuvor',
    problem: 'Keine Untersuchung, kein Protokoll'
}]->(mark)

CREATE (kuhn)-[:LEGT_VOR {
    datum: '31.10.2023',
    timing: '3 Tage vor OLG-Verhandlung',
    zweck: 'Vater als paranoid darstellen'
}]->(olg)

CREATE (ga)-[:ERTEILT_HAUSVERBOT {
    datum: '20.12.2023',
    grund: 'Mark fragte nach Stellungnahme'
}]->(mark)

// ============================================
// MUTTER-SCHUTZ-NETZWERK
// ============================================

CREATE (kuhn)-[:SCHUETZT {
    art: 'Alkoholprobleme nicht in Berichte',
    art2: 'Diebstahl nicht thematisiert'
}]->(aleksandra)

CREATE (hellenthal)-[:SCHUETZT {
    art: 'Antraege Alkoholtest abgelehnt'
}]->(aleksandra)

CREATE (praksys)-[:BERICHTET_POSITIV_UEBER {
    trotz: 'Dokumentierter Alkoholprobleme'
}]->(aleksandra)

// ============================================
// PRAKSYS INTERN
// ============================================

CREATE (rebecca)-[:ARBEITET_FUER]->(praksys)
CREATE (susanne)-[:LEITET]->(praksys)

// ============================================
// JUGENDAMT HIERARCHIE
// ============================================

CREATE (schallenberg)-[:LEITET]->(brand)
CREATE (schallenberg)-[:LEITET]->(bluth)
CREATE (bluth)-[:VORGESETZTER_VON]->(meiser_ja)

// ============================================
// GESUNDHEITSAMT STRUKTUR
// ============================================

CREATE (birk)-[:LEITET]->(ga)
CREATE (gestier)-[:ARBEITET_FUER]->(ga)
CREATE (meiser_ga)-[:ARBEITET_FUER]->(ga)

// ============================================
// GERICHT STRUKTUR
// ============================================

CREATE (hellenthal)-[:ARBEITET_AN]->(ag)

// ============================================
// DAS PARADOX
// ============================================

CREATE (paradox:Paradox {
    name: 'Das Sicherheits-Paradox',
    beschreibung: 'Mark hatte Zugang zu GEHEIM-Unterlagen, baute TKÜ-Anlagen fuer LKA - aber wird nach 15min als paranoid diagnostiziert'
})

CREATE (mark)-[:WIDERLEGT]->(paradox)
CREATE (birk)-[:IGNORIERT]->(paradox)

// ============================================
// ZEITACHSE (wichtige Events)
// ============================================

CREATE (e1:Event {
    name: 'Beginn Psychoterror durch Mutter',
    datum: 'Juni 2022'
})

CREATE (e2:Event {
    name: 'Kuhn erschleicht Vertrauen',
    datum: 'Dezember 2022',
    zitat: 'Ich gehoere nicht zu denen'
})

CREATE (e3:Event {
    name: 'Gesundheitsamt-Gespraech',
    datum: '16.02.2023',
    dauer: '15 Minuten'
})

CREATE (e4:Event {
    name: 'Paranoia-Diagnose erstellt',
    datum: '26.10.2023'
})

CREATE (e5:Event {
    name: 'Diagnose dem OLG vorgelegt',
    datum: '31.10.2023',
    timing: '3 Tage vor Verhandlung'
})

CREATE (e6:Event {
    name: 'OLG Verhandlung',
    datum: '02.11.2023'
})

CREATE (e7:Event {
    name: 'Hausverbot Gesundheitsamt',
    datum: '20.12.2023'
})

CREATE (e8:Event {
    name: 'Noetigung Kuhn/Bohnenberger',
    datum: '29.01.2025',
    beleg: 'Audio'
})

CREATE (e1)-[:DANN]->(e2)
CREATE (e2)-[:DANN]->(e3)
CREATE (e3)-[:DANN]->(e4)
CREATE (e4)-[:DANN]->(e5)
CREATE (e5)-[:DANN]->(e6)
CREATE (e6)-[:DANN]->(e7)
CREATE (e7)-[:DANN]->(e8)

// ============================================
// QUERIES
// ============================================

// 1. Zeige Mark im Zentrum mit allen Verbindungen:
// MATCH (mark:Betroffener)-[r]-(other) RETURN mark, r, other

// 2. Zeige wer Kuhn schuetzt:
// MATCH (protector)-[:SCHUETZT]->(kuhn:SozialerDienst) RETURN protector, kuhn

// 3. Zeige wer die Mutter schuetzt:
// MATCH (protector)-[:SCHUETZT]->(mutter:Hauptperson) RETURN protector, mutter

// 4. Zeige Gesundheitsamt-Kette:
// MATCH path = (meiser)-[*]-(olg:Gericht) RETURN path

// 5. Zeige Timeline:
// MATCH (e:Event)-[:DANN*]->(next:Event) RETURN e, next

// 6. Komplettes Netzwerk:
// MATCH (n)-[r]->(m) RETURN n, r, m

// 7. Finde alle Schutz-Beziehungen:
// MATCH (a)-[:SCHUETZT]->(b) RETURN a.name AS Schuetzt, b.name AS Geschuetzt

// 8. Zeige Hierarchie RVS:
// MATCH (a)-[:LEITET|VORGESETZTER_VON|BERICHTET_AN]->(b) RETURN a, b

