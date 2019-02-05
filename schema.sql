-- Harper-Lite Database Schema
--
-- * Every record has a unique `id` serial number within its table.
--
-- * All foreign keys are named `TABLE_id` where `TABLE` is the name of the
--   table they reference.
--
-- * The `created` timestamp fields record "YYYY-MM-DD HH:MM:SS" UTC timestamps.
--
-- * All text fields marked `not null` are expected to be non-empty as well.
--
-- * Lessons and people can be updated, and so are represented using a two-part
--   structure: `THING_anchor` as a common reference, and `THING_version` with
--   user-visible details.
--
-- * "Keywords" are actually phrases used to identify prerequisites (what the
--   learner needs to know to start the lesson) and postrequisites (what the
--   lesson hopes they'll understand afterward).  These are not versioned
--   because they are not supplanted, just added to.
--
-- * If a lesson's keywords (prereqs or postreqs) are changed in order to use
--   more canonical terminology, create a new version of the lesson and tie the
--   new (canonical) keywords to that version.

-- Unique identifier for a lesson.
create table lesson_anchor (
	id			integer	not null primary key,
	created			text	not null
);

-- Details of a specific version of a lesson.
create table lesson_version (
	id			integer	not null primary key,
	lesson_anchor_id	integer	not null,
	last_updated		integer	not null,
	title			text	not null,
	abstract		text	not null,
	version			text	not null,
	package			text,
	license			text	not null,
	notes			text	not null,
	foreign key(lesson_anchor_id)	references lesson_anchor(id)
);

-- Unique identifier for a person.
create table person_anchor (
	id			integer	not null primary key,
	created			text	not null
);

-- Details of a specific version of a person.
create table person_version (
	id			integer	not null primary key,
	person_anchor_id	integer	not null,
	last_updated		integer	not null,
	name			text	not null,
	sort_name		text	not null,
	email			text,
	foreign key(person_anchor_id)	references person_anchor(id)
);

-- Join table connecting people to lessons.
create table contributor (
	id			integer	not null primary key,
	lesson_version_id	integer	not null,
	person_version_id	integer	not null,
	foreign key(lesson_version_id)	references lesson_version(id),
	foreign key(person_version_id)	references person_version(id)
);

-- Learning objectives for each version of a lesson.
create table objective (
	id			integer	not null primary key,
	lesson_version_id	integer	not null,
	objective		text	not null,
	foreign key(lesson_version_id)	references lesson_version(id)
);

-- Keywords (actually phrases) used for prereqs and postreqs.
create table keyword (
	id			integer	not null primary key,
	created			text	not null,
	keyword			text	not null
);

-- Join table connecting keywords as prerequisites of a lesson version.
create table pre_req (
	id			integer	not null primary key,
	lesson_version_id	integer	not null,
	keyword_id		integer	not null,
	foreign key(keyword_id)		references keywords(id)
	foreign key(lesson_version_id)	references lesson_version(id)
);

-- Join table connecting keywords as postrequisites of a lesson version.
create table post_req (
	id			integer	not null primary key,
	lesson_version_id	integer	not null,
	keyword_id		integer	not null,
	foreign key(keyword_id)		references keywords(id)
	foreign key(lesson_version_id)	references lesson_version(id)
);

-- Software requirements for each lesson version.
-- `major` is the major heading (e.g., "R" or "Python").
-- `minor` is the minor requirement (e.g., the package name).
-- `details` is optional extra information (e.g., a version specification).
create table requirement (
	id			integer	not null primary key,
        lesson_version_id	integer	not null,
	major			text	not null,
	minor			text	not null,
        details			text,
	foreign key(lesson_version_id)	references lesson_version(id)
);
