.header on
.mode column

SELECT 
    title AS Title, 
    p_type AS [Paper Type], 
    page_vol_num AS [Page Vol Num], 
    date(ts_publication, 'unixepoch') AS [Publication Date], 
    doi AS DOI, 
    acknowledgement AS Acknowledgement, 
    sources_url AS [Sources URL], 
    pdf_url AS [PDF URL],
    (
        SELECT (conferences.conf_name || ", " || COALESCE(conferences.rank, ''))
        FROM conferences
        INNER JOIN papers ON (conferences.id = papers.conference_id)
    ) AS Conference,
    (
        SELECT (journals.journal_name || ", " || COALESCE(journals.quartile , ''))
        FROM journals
        INNER JOIN papers
            ON (papers.conference_id = journals.id)
    ) AS Journal,
    (
        SELECT group_concat((authors.author_name || ", " || authors.affiliation), '; ')
        FROM authors
        JOIN authors_papers ON authors.id = authors_papers.author_id 
        JOIN papers ON papers.id = authors_papers.paper_id
    ) AS Authors,
    (
        SELECT group_concat(keyword, ', ') FROM keywords
        JOIN keywords_papers ON keywords.id = keywords_papers.keyword_id
        JOIN papers ON papers.id = keywords_papers.paper_id
    ) AS Keywords
FROM papers;
-- As group_concat is considered slow, it will not be used in production, only for clever output here.
.header off