module repository

import canonical.id as cid
import canonical.person.name as cname
import db.sqlite

struct PersonNameSqlite {
mut:
	db sqlite.DB
}

pub fn (this PersonNameSqlite) get(id cid.Id) !cname.Name {
	mut name := cname.Name{
		id: id
	}

	name_dbs := sql this.db {
		select from Person__NameDb where id == id
	}!

	if name_dbs.len < 1 {
		return error('name ${id} not found')
	}

	if name_dbs.len > 1 {
		return error('name ${id} found duplicates')
	}

	name.first << sql this.db {
		select from Person__Name__FirstDb where person_id == id order by index
	}!.map(|row| row.name)

	name.middle << sql this.db {
		select from Person__Name__MiddleDb where person_id == id order by index
	}!.map(|row| row.name)

	name.last << sql this.db {
		select from Person__Name__LastDb where person_id == id order by index
	}!.map(|row| row.name)

	return name
}

pub fn (this PersonNameSqlite) save(name cname.Name) ! {
	name_db := Person__NameDb{
		id: name.id
	}

	sql this.db {
		insert name_db into Person__NameDb
	}!

	mut first := []Person__Name__FirstDb{}

	for i, n in name.first {
		first << Person__Name__FirstDb{
			person_id: name.id
			index:     i
			name:      n
		}
	}

	sql this.db {
		insert first into Person__Name__FirstDb
	}!

	mut middle := []Person__Name__MiddleDb{}

	for i, n in name.middle {
		middle << Person__Name__MiddleDb{
			person_id: name.id
			index:     i
			name:      n
		}
	}

	sql this.db {
		insert middle into Person__Name__MiddleDb
	}!

	mut last := []Person__Name__LastDb{}

	for i, n in name.last {
		last << Person__Name__LastDb{
			person_id: name.id
			index:     i
			name:      n
		}
	}

	sql this.db {
		insert last into Person__Name__LastDb
	}!
}
