module person

import canonical.person.name
import db.sqlite

pub fn new_repo_sqlite(db sqlite.DB) !&RepositorySqlite {
	sql db {
		create table PersonDb
	}!

	return &RepositorySqlite{
		db:        db
		name_repo: name.new_repo_sqlite(db) or { panic(err) }
	}
}

struct RepositorySqlite {
mut:
	db        sqlite.DB
	name_repo name.Repository
}

pub fn (mut this RepositorySqlite) close() ! {
}

pub fn (this RepositorySqlite) get(id string) !Person {
	person_dbs := sql this.db {
		select from PersonDb where id == id
	}!

	if person_dbs.len < 1 {
		return error('person ${id} not found')
	}

	if person_dbs.len > 1 {
		return error('person ${id} found duplicates')
	}

	return Person{
		id:   person_dbs[0].id
		name: this.name_repo.get(person_dbs[0].name_id)!
	}
}

pub fn (mut this RepositorySqlite) save(person Person) ! {
	this.name_repo.save(person.name)!

	person_db := PersonDb{
		id:      person.id
		name_id: person.name.id
	}

	sql this.db {
		insert person_db into PersonDb
	}!
}

@[table: 'person']
struct PersonDb {
	id      string @[required]
	name_id string @[fkey: 'person_name.id'; required]
}


