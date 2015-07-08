# Kindred Britain JSON API

A JSON API for Kindred Britain v2.

## Database migration

This app includes code to restructure and import data from the Kindred Britain v1 database. Here's how each of the fields in the old database is treated by the migration:

- **`indiv`**

  - `recno`: `id`
  - `indiv_id`: Migrated directly into `Person` / `legacy_id`.
  - `sex`: Migrated directly into `Person` / `sex`.
  - `fullname`: Dropped - this can be formed from the `given_name` and `family_name`.
  - `reli`: **TODO**
  - `givn`: Migrated directly into `Person` / `given_name`.
  - `surn`: Migrated directly into `Person` / `family_name`.
  - `marnm`: **TODO**
  - `npfx`: **TODO**
  - `nsfx`: **TODO**
  - `notes`: **TODO**
  - `fams`: **TODO**
  - `famc`: **TODO**
  - `birthyear`: Migrated directly into `Person` / `birth_year`.
  - `deathyear`: Migrated directly into `Person` / `death_year`.
  - `birth_abt`: Migrated directly into `Person` / `birth_year`, with `birth_circa` flipped on.
  - `death_abt`: Migrated directly into `Person` / `death_year`, with `death_circa` flipped on.
  - `odnb`: Dropped (empty).
  - `sim20`: Dropped (empty).
  - `birt`: Dropped (empty).
  - `deat`: Dropped (empty).
  - `birthdate`: Dropped (empty).
  - `deathdate`: Dropped (empty).
  - `perioddist`: Dropped (empty).
  - `search_names`: Dropped - let's use Solr / Elasticsearch.
  - `perioddist_new`: Dropped (empty).
  - `best`: Migrated directly into `Person` / `birth_year`, with `birth_circa` flipped on.
  - `dest`: Migrated directly into `Person` / `death_year`, with `death_circa` flipped on.
  - `bestconf`: **TODO**
  - `destconf`: **TODO**
  - `chantext`: **TODO**
  - `diedyoung`: Dropped (empty).
  - `spfx`: **TODO**

- **`indiv_occu`**
  - `recno`: `id`
  - `indiv_id`: Now a FK reference on the `PersonOccupation` join table.
  - `occu`: Distinct values migrated to `Occupation` / `name`, FK references on `PersonOccupation`.

- **`event`**
  - `recno`: `id`
  - `indiv_id`: Dropped - available via particip.
  - `label`: Migrated directly into `Event` / `name`.
  - `class`: **TODO**
  - `type`: Normalized into `EventType`, referenced via `event_type_id`.
  - `period_text`: **TODO**
  - `place`: **TODO**
  - `cause`: **TODO**
  - `notes`: **TODO**
  - `event_date`: **TODO**
  - `year`: **TODO**
  - `year_abt`: **TODO**
  - `actor_id`: **TODO**
  - `year_est`: **TODO**
  - `verb`: **TODO**
  - `place_id`: **TODO**
  - `search_col`: **TODO**
  - `befaft`: **TODO**
  - `year_est_pass`: Dropped - only ~20 values?
  - `period_array`: **TODO**
  - `event_period_year`: **TODO**

- **`particip`**
  - `recno`: `id`
  - `event_id`: Mapped into `event_id`, which references `Event`.
  - `actor_id`: Mapped into `person_id`, which references `Person`.
  - `role`: **TODO**
  - `extent`: **TODO**
