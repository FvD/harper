# Design

## Database Schema

V1 uses a relational database to store information about lessons.

-   **Lesson**: lessons.
    -   *id*: integer, primary key.
-   **Lesson_Version**: versions of lessons.
    -   *id*: integer, primary key.
    -   *lesson_id*: integer, foreign key to **Lesson**.
    -   *version*: integer, revision ID.
    -   *title*: text, short title of lesson.
    -   *abstract*: text, short description of lesson.
    -   *location*: text, URL of lesson location.
    -   *contact*: integer, foreign key to **Person**.
    -   *dated*: timestamp, date of last modification.
    -   *license*: text, [SPDX][spdx] license key.
    -   *copyright*: text, name of copyright holder.
    -   *package*: text, NULLable, URL of lesson package.
    -   *language*: text, ISO code for language.
    -   *doi*: text, NULLable, lesson DOI.
    -   *context*: text, lesson background or context.
-   **Person**: individual.
    -   *id*: integer, primary key.
-   **Person_Version**: versions of personal information.
    -   *id*: integer, primary key.
    -   *person_id*: integer, foreign key to **Person**.
    -   *version*: integer, revision ID.
    -   *full_name*: text, full name.
    -   *sort_name*: text, name for sorting purposes.
    -   *email*: text, NULLable, email address.
    -   *url*: text, NULLable, preferred URL.
    -   *orcid*: text, NULLable, ORCID.
-   **Author**: join table connecting individuals to lesson versions.
    -   *id*: integer, primary key.
    -   *lesson_version_id*: integer, foreign key to **Lesson_Version**.
    -   *person_id*: integer, foreign key to **Person**.
-   **Requirement**: list of requirements for a version of a lesson.
    -   *id*: integer, primary key.
    -   *requirement*: text, requirement.
-   **Requirement_Version**: specific requirement for a version of a lesson.
    -   *id*: integer, primary key.
    -   *requirement_id*: integer, foreign key into **Requirement**.
    -   *lesson_version_id*: integer, foreign key to **Lesson_Version**.
    -   *version*: text, NULLable, version specification.
-   **Timeframe**: list of timeframes for a version of a lesson.
    -   *id*: integer, primary key.
    -   *lesson_version_id*: integer, foreign key to **Lesson_Version**.
    -   *timeframe*: text, descripton of how long it takes to deliver or do lesson.
-   **Objective**: learning objectives for a version of a lesson.
    -   *id*: integer, primary key.
    -   *lesson_version_id*: integer, foreign key to **Lesson_Version**.
    -   *objective*: text, learning objective.
-   **Keypoint**: key points for a version of a lesson.
    -   *id*: integer, primary key.
    -   *lesson_version_id*: integer, foreign key to **Lesson_Version**.
    -   *keypoint*: text, key point.
-   **Term**: consolidated glossary entries.
    -   *id*: integer, primary key.
    -   *term*: text, term being defined.
    -   *acronym*: text, NULLable, acronym of term.
-   **Term_Version**: version of term definition.
    -   *id*: integer, primary key.
    -   *term_id*: integer, foreign key to **Term**.
    -   *version*: integer, revision ID.
    -   *definition*: text, definition of term.
-   **Glossary**: join table connecting versions of glossary terms to versions of lessons.
    -   *id*: integer, primary key.
    -   *lesson_version_id*: where definition resides.
    -   *term_version_id*: definition of term.
-   **Source**: sources for a version of a lesson.
    -   *id*: integer, primary key.
    -   *source*: link to source.

## API

-   GET `/lesson`: get list of all lessons.
-   GET `/lesson/ID`: get details of most recent version of a lesson.
-   GET `/lesson/ID/VERSION`: get details of specific version of lesson.
-   GET `/person`: get list of all persons.
-   GET `/person/ID`: get details of most recent version of person.
-   GET `/person/ID/VERSION`: get details of specific version of person.
-   GET `/requirement`: get list of all requirements.
-   GET `/requirement/ID`: get details of all versions of requirement.
-   GET `/term`: get list of all terms.
-   GET `/term/i/ID`: get current definition of term.
-   GET `/term/i/ID/VERSION`: get specific version of definition of term.
-   GET `/term/t/WORD`: get current definition of term.
-   GET `/term/t/WORD/VERSION`: get specific version of definition of term.

[spdx]: https://spdx.org/
