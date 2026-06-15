module name

import canonical.id as cid
import db.sqlite

pub fn new_repo_sqlite(path string) !&NameRepositorySqlite {
	db := sqlite.connect(path)!

	sql db {
		create table NameDb
		create table NameFirstDb
		create table NameMiddleDb
		create table NameLastDb
	}!

	return &NameRepositorySqlite{
		db: db
	}
}

struct NameRepositorySqlite {
mut:
	db sqlite.DB
}

pub fn (mut this NameRepositorySqlite) close() ! {
	this.db.close()!
}

pub fn (this NameRepositorySqlite) get(id cid.Id) !Name {
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

	firsts := sql this.db {
		select from NameFirstDb where person_id == id order by index
	}!

	for first in firsts {
		name.first << first.name
	}

	middles := sql this.db {
		select from NameMiddleDb where person_id == id order by index
	}!

	for middle in middles {
		name.middle << middle.name
	}

	lasts := sql this.db {
		select from NameLastDb where person_id == id order by index
	}!

	for last in lasts {
		name.last << last.name
	}

	return name
}

pub fn (this NameRepositorySqlite) save(name Name) ! {
	name_db := NameDb{
		id: name.id
	}

	mut firsts := []NameFirstDb{}

	for i, nname in name.first {
		firsts << NameFirstDb{
			person_id: name.id
			index:     i
			name:      nname
		}
	}

	mut middles := []NameMiddleDb{}

	for i, nname in name.first {
		middles << NameMiddleDb{
			person_id: name.id
			index:     i
			name:      nname
		}
	}

	mut lasts := []NameLastDb{}

	for i, nname in name.first {
		lasts << NameLastDb{
			person_id: name.id
			index:     i
			name:      nname
		}
	}

	sql this.db {
		insert name_db into NameDb
	}!
}

@[table: 'person_name']
struct NameDb {
pub:
	id string @[required]
}

@[table: 'person_name_first']
struct NameFirstDb {
pub:
	person_id string @[fkey: 'person_name.id'; required]
	index     int    @[required]
	name      string @[required]
}

@[table: 'person_name_middle']
struct NameMiddleDb {
pub:
	person_id string @[fkey: 'person_name.id'; required]
	index     int    @[required]
	name      string @[required]
}

@[table: 'person_name_last']
struct NameLastDb {
pub:
	person_id string @[fkey: 'person_name.id'; required]
	index     int    @[required]
	name      string @[required]
}




