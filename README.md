# Database-Fundamentals-Assignment-02
This assignment was created in the second year and first semester of the Creative Computing course at South East Technological University.
# Assignment 02 — Kingdom Hearts Relational Database

**Author:** Annetta Hawkins

---

## Overview

This project is a fully relational MySQL database modelling the *Kingdom Hearts* video game franchise. It covers games, characters, worlds, keyblades, voice actors, and in-game assets, along with the many-to-many relationships that connect them. A separate query file demonstrates a wide range of SQL techniques against the database.

---

## Files

| File | Description |
|---|---|
| `KingdomHeartsDatabase.sql` | Creates the database, defines all 12 tables, and populates them with sample data. |
| `KingdomHeartsQueries.sql` | A collection of SELECT queries showcasing various SQL clauses and techniques. |

---

## Database Schema

The database contains **12 tables** organised into three logical groups:

### Core Entity Tables

| Table | Description |
|---|---|
| `Game` | Stores each Kingdom Hearts title, its release date, and platform. |
| `Characters` | Stores playable and non-playable characters, linked to a game and an organisation. |
| `World` | Represents in-game worlds, each tied to a specific game. |
| `Keyblade` | Stores every keyblade and its description. |
| `Voiced_Actor` | Stores voice actors and the language they perform in. |
| `Asset` | Stores game assets (models, audio, FX, video, textures). |
| `Organization` | Stores the factions and groups characters can belong to. |

### Junction / Relationship Tables

These tables model many-to-many relationships using composite primary keys:

| Table | Relationship |
|---|---|
| `Wields` | Links characters to the keyblades they wield. |
| `Appears_in` | Links characters to the worlds they appear in. |
| `Voiced_By` | Links characters to their voice actors. |
| `Used_Assets` | Links games to the assets used in them. |
| `Keyblade_Element` | Links keyblades to one or more elemental types (e.g., Light, Fire, Wind). |

### Entity-Relationship Summary

```
Game ──────< World
  │
  └────────< Characters >──── Organization
                │     │
                │     └────< Voiced_By >──── Voiced_Actor
                │
                └────< Wields >──── Keyblade ──< Keyblade_Element
                │
                └────< Appears_in >──── World

Game ──────< Used_Assets >──── Asset
```

---

## Sample Data

The database is seeded with realistic data across all tables:

- **12 games** spanning the franchise from *Kingdom Hearts* (2002) to *Kingdom Hearts Dark Road* (2020), across PlayStation, Nintendo, and mobile platforms.
- **10 organisations** including Organisation XIII, the Wayfinder Trio, and the Guardians of Light.
- **12 worlds** such as Destiny Islands, Hollow Bastion, and San Fransokyo.
- **15 characters** including Sora, Riku, Kairi, Roxas, Aqua, Terra, and Xehanort.
- **12 voice actors** in both English and Japanese.
- **11 keyblades** each with elements and character associations.
- **12 assets** of types Model, Audio, FX, Video, and Texture.

---

## Query Techniques Demonstrated

`KingdomHeartsQueries.sql` is organised into labelled sections, each targeting a specific SQL concept:

| Technique | What It Demonstrates |
|---|---|
| `WHERE` | Basic filtering by equality, single-column conditions. |
| `WHERE IN` | Filtering against a list of values (e.g., multiple organisation IDs). |
| `WHERE BETWEEN` | Filtering games by a date range. |
| `WHERE LIKE` | Pattern matching on world names (e.g., names ending in "Town"). |
| Multiple `WHERE` conditions | Combining `AND` / `IN` for compound filters. |
| Date functions | `YEAR()` to extract the release year; `TIMESTAMPDIFF()` with `CURDATE()` to calculate a game's age. |
| `INNER JOIN` | Joining Characters to Game, Organization, and Voice Actors across multiple tables. |
| `LEFT JOIN` | Returning all characters even if they wield no keyblade, or all keyblades even if unassigned. |
| `RIGHT JOIN` | Returning all keyblades including those wielded by no character. |
| `MIN()` / `MAX()` | Finding the earliest and latest game release dates. |
| `GROUP BY` | Counting characters per organisation; counting keyblades per element type. |
| `HAVING` | Filtering grouped results (e.g., organisations with more than one member). |
| `ORDER BY` | Sorting games by release date; sorting characters alphabetically in reverse. |
| `DISTINCT` | Listing unique world types with no duplicates. |
| Subquery | Identifying characters who wield more than one keyblade using a nested `SELECT` with `GROUP BY` and `HAVING`. |

---

## How to Run

1. Make sure you have **MySQL** (or a compatible DBMS such as MariaDB) installed and running.
2. Open a MySQL client (e.g., MySQL Workbench, the `mysql` CLI, or any SQL IDE).
3. Run the database setup file first:
   ```sql
   SOURCE KingdomHeartsDatabase.sql;
   ```
   This creates the `kingdom_hearts` database, defines all tables, and inserts the sample data.
4. Run the queries file:
   ```sql
   SOURCE KingdomHeartsQueries.sql;
   ```
   Each query is prefaced with a comment describing what it does, so you can execute them individually or all at once.

---

## Requirements

- MySQL 5.7+ or MariaDB 10.2+
- Any SQL client capable of executing `.sql` script files.
