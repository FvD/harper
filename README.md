# Harper-Lite: Simple Lesson Discovery and Aggregation

Harper's goal is better learning outcomes with less effort;
Harper-Lite's is to get the ball rolling with as little effort as possible.
Please see [the full proposal](./harper-full.md) for a full description.

To make a lesson easier to find and re-use,
authors create one extra text file called `harper.yml` and put it in the lesson's root directory.
`harper.yml` is formatted as YAML and must contain all of the fields shown below:

```
schema: "harper-lite 0.1"
title: "The Title of the Lesson"
abstract: >
  A single-paragraph summary of the lesson, the shorter the better.
  It can be broken across multiple lines as shown here, and can
  use [Markdown](https://en.wikipedia.org/wiki/Markdown) formatting.
version: "1.3"
contributor:
  - "Some Name <email@address>"
  - "Another Name <their@address>"
package: http://package.url/lesson.zip
license: http://license.url/
requirements:
  R:
  - "package_1"
  - "package_2>=1.2.3.4"
objectives:
  - "Some learning objective."
  - "Some other learning objective."
requires:
  - "a glossary term"
  - "a skill"
teaches:
  - "a term defined in this lesson"
  - "a skill taught in this lesson"
notes: >
  One or more sentences describing things instructors ought to know, formatted with Markdown.
  For example, the notes could explain how long the lesson usually takes to do.
```

Notes:
-   The `schema` field identifies this as Harper-Lite Version 0.1.
-   The `title` and `abstract` fields should be self-explanatory.
-   The `version` field is the version of the lesson (typically also the version of the package it's for).
-   Contributors do not need to provide email addresses.
-   The `license` value is the URL of the license rather than an abbreviation.
    We will strongly encourage people to point at licenses at <https://opensource.org/>.
-   The `package` field is the URL for the downloadable lesson materials.
-   `requirements` specifies any packages required,
    organized under one sub-key per language,
    using the syntax preferred by that language's default package manager.
-   Learning objectives should be single sentences, each with an active verb,
    describing something observable.
-   The items under `requires` and `teaches` are meant to be keywords, not full explanations.
    These will be used to optimize search and to help people stitch lessons together
    (e.g., "The lesson I want requires X---where can I learn about it?").
    After discussion, we've grouped terms and skills together to keep the YAML simple;
    entries may use Markdown formatting (e.g., to show `function_names`).
-   `notes is for anything else that might be helpful.

An example of a `harper.md` file is shown below;

```
schema: "harper-lite 0.1"
title: "Tests of Univariate Normality"
abstract: >
  How can we tell if univariate data is normally distributed?
  This lesson describes three tests and explains the strengths and weaknesses of each.
version: "1.3.1"
contributor:
  - "Walter Bishop <w.bishop@fringe.tv>"
package: http://stats.fringe.tv/stats454/normality/stats454-normality.zip
license: https://creativecommons.org/licenses/by-nc/4.0/
requirements:
  R:
  - "nickr (>=1.2.3.4)"
objectives:
  - "Describe the 68-95-99.7 rule and explain why it works and when it fails."
  - "Describe and apply the Shapiro-Wilk test for normality of univariate data."
  - "Describe and apply the ECF test for normality of multivariate data."
requires:
  - "Normal distribution"
  - "Quantiles"
  - "Statistical power"
  - "Covariance matrix"
  - "Empirical characteristic function"
  - "Install R package"
teaches:
  - "`quantile`"
  - "Kurtosis risk"
  - "68/95/99.7 Rule"
  - "Shapiro-Wilk test"
  - "ECF test"
notes: >
  This material was originally developed as part of a sequence on data integrity
  for seniors and graduate students in statistics, then modified for delivery in
  conference workshops.  The Shapiro-Wilk material feels pretty solid; the ECF
  material has only been used a couple of times, and probably needs more work.
```
