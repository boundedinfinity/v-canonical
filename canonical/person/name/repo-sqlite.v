module name

import canonical.id as cid
import db.sqlite

pub fn new_repo_sqlite(db sqlite.DB) !&Repository {
	sql db {
		create table NameDb
		create table NameFirstDb
		create table NameMiddleDb
		create table NameLastDb
	}!

	return &RepositorySqlite{
		db: db
	}
}

struct RepositorySqlite {
mut:
	db sqlite.DB
}

pub fn (mut this RepositorySqlite) close() ! {
}

pub fn (this RepositorySqlite) get(id cid.Id) !Name {
	mut name := Name{
		id: id
	}

	name_dbs := sql this.db {
		select from NameDb where id == id
	}!

	if name_dbs.len < 1 {
		return error('name ${id} not found')
	}

	if name_dbs.len > 1 {
		return error('name ${id} found duplicates')
	}

	name.first << sql this.db {
		select from NameFirstDb where person_id == id order by index
	}!.map(|row| row.name)

	name.middle << sql this.db {
		select from NameMiddleDb where person_id == id order by index
	}!.map(|row| row.name)

	name.last << sql this.db {
		select from NameLastDb where person_id == id order by index
	}!.map(|row| row.name)

	return name
}

pub fn (this RepositorySqlite) save(name Name) ! {
	name_db := NameDb{
		id: name.id
	}

	sql this.db {
		insert name_db into NameDb
	}!

	mut first := []NameFirstDb{}

	for i, n in name.first {
		first << NameFirstDb{
			person_id: name.id
			index:     i
			name:      n
		}
	}

	sql this.db {
		insert first into NameFirstDb
	}!

	mut middle := []NameMiddleDb{}

	for i, n in name.middle {
		middle << NameMiddleDb{
			person_id: name.id
			index:     i
			name:      n
		}
	}

	sql this.db {
		insert middle into NameMiddleDb
	}!

	mut last := []NameLastDb{}

	for i, n in name.last {
		last << NameLastDb{
			person_id: name.id
			index:     i
			name:      n
		}
	}

	sql this.db {
		insert last into NameLastDb
	}!
}

@[table: 'person_name']
struct NameDb {
pub:
	id string @[required]
}

@[table: 'person_name__first']
struct NameFirstDb {
	person_id string @[fkey: 'person_name.id'; required]
	index     int    @[required]
	name      string @[required]
}

@[table: 'person_name__middle']
struct NameMiddleDb {
	person_id string @[fkey: 'person_name.id'; required]
	index     int    @[required]
	name      string @[required]
}

@[table: 'person_name__last']
struct NameLastDb {
	person_id string @[fkey: 'person_name.id'; required]
	index     int    @[required]
	name      string @[required]
}

