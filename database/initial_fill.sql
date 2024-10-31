--Inserting paper conference
INSERT INTO conferences(conf_name) VALUES ('2013 Information Theory and Applications Workshop (ITA)');

--Inserting paper
INSERT INTO papers(title, p_type, ts_publication, doi, conference_id)
SELECT 
    'Improved MU-MIMO Performance for Future 802.11 Systems Using Differential Feedback',
    'conference',
    unixepoch('2013-02-10'),
    '10.1109/ITA.2013.6502944',
    seq
FROM sqlite_sequence 
WHERE name="conferences";

--Inserting authors and their relation with paper
INSERT INTO authors(author_name, affiliation) VALUES ('Ron Porat', 'Broadcom');
INSERT INTO authors_papers(author_id, paper_id)
SELECT 
    (SELECT seq FROM sqlite_sequence WHERE name = 'authors'),
    (SELECT seq FROM sqlite_sequence WHERE name = 'papers');


INSERT INTO authors(author_name, affiliation) VALUES ('Eric Ojard', 'Broadcom');
INSERT INTO authors_papers(author_id, paper_id)
SELECT 
    (SELECT seq FROM sqlite_sequence WHERE name = 'authors'),
    (SELECT seq FROM sqlite_sequence WHERE name = 'papers');

INSERT INTO authors(author_name, affiliation) VALUES ('Nihar Jindal', 'Broadcom');
INSERT INTO authors_papers(author_id, paper_id)
SELECT 
    (SELECT seq FROM sqlite_sequence WHERE name = 'authors'),
    (SELECT seq FROM sqlite_sequence WHERE name = 'papers');

INSERT INTO authors(author_name, affiliation) VALUES ('Matthew Fischer', 'Broadcom');
INSERT INTO authors_papers(author_id, paper_id)
SELECT 
    (SELECT seq FROM sqlite_sequence WHERE name = 'authors'),
    (SELECT seq FROM sqlite_sequence WHERE name = 'papers');

INSERT INTO authors(author_name, affiliation) VALUES ('Vinko Erceg', 'Broadcom');
INSERT INTO authors_papers(author_id, paper_id)
SELECT 
    (SELECT seq FROM sqlite_sequence WHERE name = 'authors'),
    (SELECT seq FROM sqlite_sequence WHERE name = 'papers');

--Inserting keywords and their relation with paper
INSERT INTO keywords(keyword) VALUES ('Aging');
INSERT INTO keywords_papers(keyword_id, paper_id)
SELECT 
    (SELECT seq FROM sqlite_sequence WHERE name = 'keywords'),
    (SELECT seq FROM sqlite_sequence WHERE name = 'papers');

INSERT INTO keywords(keyword) VALUES ('Antennas');
INSERT INTO keywords_papers(keyword_id, paper_id)
SELECT 
    (SELECT seq FROM sqlite_sequence WHERE name = 'keywords'),
    (SELECT seq FROM sqlite_sequence WHERE name = 'papers');

INSERT INTO keywords(keyword) VALUES ('Quantization (signal)');
INSERT INTO keywords_papers(keyword_id, paper_id)
SELECT 
    (SELECT seq FROM sqlite_sequence WHERE name = 'keywords'),
    (SELECT seq FROM sqlite_sequence WHERE name = 'papers');

INSERT INTO keywords(keyword) VALUES ('Throughput');
INSERT INTO keywords_papers(keyword_id, paper_id)
SELECT 
    (SELECT seq FROM sqlite_sequence WHERE name = 'keywords'),
    (SELECT seq FROM sqlite_sequence WHERE name = 'papers');

INSERT INTO keywords(keyword) VALUES ('Channel estimation');
INSERT INTO keywords_papers(keyword_id, paper_id)
SELECT 
    (SELECT seq FROM sqlite_sequence WHERE name = 'keywords'),
    (SELECT seq FROM sqlite_sequence WHERE name = 'papers');

INSERT INTO keywords(keyword) VALUES ('Downlink');
INSERT INTO keywords_papers(keyword_id, paper_id)
SELECT 
    (SELECT seq FROM sqlite_sequence WHERE name = 'keywords'),
    (SELECT seq FROM sqlite_sequence WHERE name = 'papers');

INSERT INTO keywords(keyword) VALUES ('Correlation');
INSERT INTO keywords_papers(keyword_id, paper_id)
SELECT 
    (SELECT seq FROM sqlite_sequence WHERE name = 'keywords'),
    (SELECT seq FROM sqlite_sequence WHERE name = 'papers');