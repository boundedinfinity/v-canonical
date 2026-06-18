module repository

import canonical.person as cperson
import db.sqlite

struct PersonSqlite {
mut:
	db sqlite.DB
}

fn (this PersonSqlite) name() PersonNameSqlite {
	return PersonNameSqlite{
		db: this.db
	}
}

pub fn (this PersonSqlite) get(id string) !cperson.Person {
	person_dbs := sql this.db {
		select from PersonDb where id == id
	}!

	if person_dbs.len < 1 {
		return error('person ${id} not found')
	}

	if person_dbs.len > 1 {
		return error('person ${id} found duplicates')
	}

	return cperson.Person{
		id:   person_dbs[0].id
		name: this.name().get(person_dbs[0].name_id)!
	}
}

pub fn (mut this PersonSqlite) save(person cperson.Person) ! {
	this.name().save(person.name)!

	person_db := PersonDb{
		id:      person.id
		name_id: person.name.id
	}

	sql this.db {
		insert person_db into PersonDb
	}!
}

