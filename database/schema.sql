CREATE TABLE IF NOT EXISTS authors (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                author_name TEXT NOT NULL,
                affiliation TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS keywords (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                keyword TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS conferences (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                conf_name TEXT NOT NULL UNIQUE,
                rank TEXT CHECK( rank IN ('A+', 'A', 'B', 'C', NULL)) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS journals (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                journal_name TEXT NOT NULL UNIQUE,
                quartile TEXT CHECK( quartile IN ('Q1', 'Q2', 'Q3', 'Q4', NULL)) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS papers (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                title TEXT NOT NULL UNIQUE,
                p_type TEXT CHECK( p_type IN ('journal', 'conference')) NOT NULL,
                conference_id INTEGER REFERENCES conferences(id),
                journal_id INTEGER REFERENCES journals(id),
                page_vol_num TEXT DEFAULT NULL,
                ts_publication INTEGER NOT NULL,
                doi TEXT NOT NULL UNIQUE,
                acknowledgement TEXT DEFAULT NULL,
                sources_url TEXT DEFAULT NULL,
                pdf_url TEXT DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS authors_papers (
                author_paper_id INTEGER PRIMARY KEY AUTOINCREMENT,
                author_id INTEGER NOT NULL REFERENCES authors(id),
                paper_id INTEGER NOT NULL REFERENCES papers(id)
);

CREATE TABLE IF NOT EXISTS keywords_papers (
                keyword_paper_id INTEGER PRIMARY KEY AUTOINCREMENT,
                keyword_id INTEGER NOT NULL REFERENCES keyword(id),
                paper_id INTEGER NOT NULL REFERENCES papers(id)
);