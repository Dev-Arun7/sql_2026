# SQL 2026 🐘

A structured, practical **PostgreSQL learning repository** covering SQL from the fundamentals to relational database concepts.

> Learn SQL by writing, running, and experimenting with real queries.

## 📚 Topics

### SQL Fundamentals

* SELECT
* WHERE
* ORDER BY
* DISTINCT
* LIMIT / OFFSET
* IN / BETWEEN
* LIKE / ILIKE
* NULL

### Queries & Functions

* GROUP BY
* HAVING
* Aggregate Functions
* Arithmetic Operators
* COALESCE / NULLIF
* Date & Time
* EXTRACT / AGE

### Database Design

* Primary Key
* UNIQUE
* CHECK
* Foreign Key
* BIGSERIAL
* UUID
* INSERT / UPDATE / DELETE
* ON CONFLICT

### Relationships

* JOIN
* LEFT JOIN
* JOIN ... USING
* Foreign Key Relationships

### PostgreSQL

* Extensions
* Sequences
* UUID Generation
* psql commands
* Exporting query results to CSV

## 📁 Structure

Topics are organized progressively, with each `.sql` file focused on a specific concept and practical examples.

```text id="lq8g1r"
sql_2026/
├── 01_...
├── 02_...
└── README.md
```

## 🚀 Getting Started

Install PostgreSQL and open `psql`:

```bash id="z1q6mh"
psql -U postgres -h localhost -d test
```

Run any lesson:

```sql id="9f0q6v"
\i /path/to/file.sql
```

Then experiment with the queries and modify them to understand how they work.

## 🎯 Goal

Build a strong foundation in **SQL and PostgreSQL** through practical, progressively structured examples.

**Learn → Run → Modify → Understand**
