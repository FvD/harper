-- Example Harper-Lite database for explanatory and testing purposes.
-- Use `schema.sql` to create tables first.

insert into lesson_anchor values (1, "2019-01-01 09:00:00");

insert into lesson_version values (
	1,
        1,
        "2019-01-01 09:00:01",
        "Tests of Univariate Normality",
        "How can we tell if univariate data is normally distributed?\nThis lesson describes three tests and explains the strengths and weaknesses of each.",
        "1.3.1",
	"http://stats.fringe.tv/stats454/normality/stats454-normality.zip",
	"https://creativecommons.org/licenses/by-nc/4.0/",
	"This material was originally developed as part of a sequence on data integrity\nfor seniors and graduate students in statistics, then modified for delivery in\nconference workshops.  The Shapiro-Wilk material feels pretty solid; the ECF\nmaterial has only been used a couple of times, and probably needs more work."
);

insert into person_anchor values
	(1, "2019-01-01 09:00:01")
;

insert into person_version values (
	1,
        1,
        "2019-01-01 09:00:02",
        "Walter Bishop",
        "Bishop, Walter",
        "w.bishop@fringe.tv"
);

insert into contributor values
	(1, 1, 1)
;

insert into objective values
	(1, 1, "Describe the 68-95-99.7 rule and explain why it works and when it fails."),
	(2, 1, "Describe and apply the Shapiro-Wilk test for normality of univariate data."),
	(3, 1, "Describe and apply the ECF test for normality of multivariate data.")
;

insert into keyword values
	(1, "2019-01-01 09:00:03", "Normal distribution"),
	(2, "2019-01-01 09:00:03", "Quantiles"),
	(3, "2019-01-01 09:00:03", "Statistical power"),
	(4, "2019-01-01 09:00:03", "Covariance matrix"),
	(5, "2019-01-01 09:00:03", "Empirical characteristic function"),
	(6, "2019-01-01 09:00:03", "Install R package"),
	(7, "2019-01-01 09:00:03", "`quantile`"),
	(8, "2019-01-01 09:00:03", "Kurtosis risk"),
	(9, "2019-01-01 09:00:03", "68/95/99.7 Rule"),
	(10, "2019-01-01 09:00:03", "Shapiro-Wilk test"),
	(11, "2019-01-01 09:00:03", "ECF test")
;

insert into pre_req values
	(1, 1, 1),
        (2, 1, 2),
        (3, 1, 3),
        (4, 1, 4),
        (5, 1, 5),
        (6, 1, 6)
;

insert into post_req values
	(1, 1, 7),
        (2, 1, 8),
        (3, 1, 9),
        (4, 1, 10),
        (5, 1, 11)
;

insert into requirement values
	(1, 1, "R", "nickr", ">=1.2.3.4")
;
