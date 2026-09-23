# PostgreSQL — Getting Started 🚀

This guide explains how to start using **PostgreSQL (`psql`) from the Linux terminal**.

---

## 1. Open the PostgreSQL Shell

From the Linux terminal, run:

```bash
sudo -u postgres psql
```

You should see something like:

```text
psql (17.11)
Type "help" for help.

postgres=#
```

You are now inside the PostgreSQL shell.

---

## 2. See All Databases

Use:

```sql
\l
```

Example:

```text
postgres=# \l

                                                List of databases
   Name    |  Owner   | Encoding | Locale Provider | Collate | Ctype | Locale | ICU Rules |   Access privileges
-----------+----------+----------+-----------------+---------+-------+--------+-----------+-----------------------
 postgres  | postgres | UTF8     | libc            | en_IN   | en_IN |        |           |
 template0 | postgres | UTF8     | libc            | en_IN   | en_IN |        |           | =c/postgres
 template1 | postgres | UTF8     | libc            | en_IN   | en_IN |        |           | =c/postgres

(3 rows)
```

The important part for beginners is the **database name**.

In this example:

```text
postgres
practice
template0
template1
```

---

## 3. Create a Database

To create a new database, use:

```sql
CREATE DATABASE test;
```

Example:

```text
postgres=# CREATE DATABASE test;
CREATE DATABASE
```

> 💡 SQL commands normally end with a semicolon `;`.

---

## 4. Connect to a Database

After creating the database, connect to it using:

```sql
\c test
```

Example:

```text
postgres=# \c test
You are now connected to database "test" as user "postgres".

test=#
```

Notice that the prompt changed from:

```text
postgres=#
```

to:

```text
test=#
```

This means you are now working inside the `test` database.

---

## 5. Check the Tables

To see the tables inside the current database:

```sql
\d
```

If the database is new, you may see:

```text
Did not find any relations.
```

This is normal. It simply means the database does not contain any tables yet.

---

## 6. Exit the PostgreSQL Shell

To leave `psql`:

```sql
\q
```

You will return to your normal Linux terminal.

---

## 🧠 Basic Commands to Remember

| Command                 | What it does               |
| ----------------------- | -------------------------- |
| `sudo -u postgres psql` | Open PostgreSQL shell      |
| `\l`                    | List all databases         |
| `CREATE DATABASE test;` | Create a database          |
| `\c test`               | Connect to `test` database |
| `\d`                    | Show tables                |
| `\q`                    | Exit PostgreSQL            |

---

## 🔄 Basic Beginner Workflow

The basic flow is:

```text
Linux Terminal
      ↓
sudo -u postgres psql
      ↓
     \l
      ↓
See available databases
      ↓
     \c database_name
      ↓
Connected to database
      ↓
     \d
      ↓
See tables
      ↓
Start writing SQL
```

> 📌 **Tip:** Commands starting with `\` such as `\l`, `\c`, `\d`, and `\q` are **psql commands**.
> Commands such as `CREATE DATABASE`, `CREATE TABLE`, `SELECT`, `INSERT`, etc. are **SQL commands**.
