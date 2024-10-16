CREATE TABLE authors (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                first_name TEXT NOT NULL,
	            last_name TEXT NOT NULL,
                affiliation TEXT NOT NULL
);

CREATE TABLE type (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                paper_type TEXT NOT NULL UNIQUE
);

CREATE TABLE keywords (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                keyword TEXT NOT NULL UNIQUE
);

CREATE TABLE conferences (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                conf_name TEXT NOT NULL UNIQUE,
                rank INTEGER
);

CREATE TABLE journals (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                journal_name TEXT NOT NULL UNIQUE,
                quartile INTEGER
);

CREATE TABLE papers (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                title TEXT NOT NULL UNIQUE,
                type_id INTEGER NOT NULL REFERENCES type(id),
                conference_id INTEGER REFERENCES conferences(id),
                journal_id INTEGER REFERENCES journals(id),
                page_vol_num TEXT,
                ts_publication INTEGER NOT NULL,
                doi TEXT NOT NULL UNIQUE,
                acknowledgement TEXT,
                sources_url TEXT,
                pdf_url TEXT
);

CREATE TABLE authors_papers (
                author_paper_id INTEGER PRIMARY KEY AUTOINCREMENT,
                author_id INTEGER NOT NULL REFERENCES authors(id),
                paper_id INTEGER NOT NULL REFERENCES papers(id)
);

CREATE TABLE keywords_papers (
                keyword_paper_id INTEGER PRIMARY KEY AUTOINCREMENT,
                keyword_id INTEGER NOT NULL REFERENCES keyword(id),
                paper_id INTEGER NOT NULL REFERENCES papers(id)
);