module label

import canonical.id as cid
import canonical.person as cperson
import db.sqlite

pub fn new_repo_sqlite(db sqlite.DB) !&RepositorySqlite {
	sql db {
		create table LabelDb
		create table LabelAbbreviationDb
		create table Label_Person
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

@[table: 'label']
struct LabelDb {
	id          string @[required]
	name        string @[required]
	description ?string
}

@[table: 'label__abbreviation']
struct LabelAbbreviationDb {
	label_id     string @[fkey: 'label.id'; required]
	index        int    @[required]
	abbreviation string @[required]
}

pub fn (this RepositorySqlite) get(id cid.Id) !Label {
	label_dbs := sql this.db {
		select from LabelDb where id == id
	}!

	if label_dbs.len < 1 {
		return error('label ${id} not found')
	}

	if label_dbs.len > 1 {
		return error('label ${id} found duplicates')
	}

	mut label := Label{
		id:          id
		name:        label_dbs[0].name
		description: label_dbs[0].description
	}

	abbreviations := sql this.db {
		select from LabelAbbreviationDb where label_id == id order by index
	}!.map(|row| row.abbreviation)

	if abbreviations.len > 0 {
		label.abbreviations = abbreviations
	}

	return label
}

pub fn (this RepositorySqlite) save(label Label) ! {
	db := LabelDb{
		id:          label.id.str()
		name:        label.name
		description: label.description
	}

	sql this.db {
		insert db into LabelDb
	}!

	mut abbreviation_dbs := []LabelAbbreviationDb{}

	for i, abbreviation in label.abbreviations {
		abbreviation_dbs << LabelAbbreviationDb{
			label_id:     label.id.str()
			index:        i
			abbreviation: abbreviation
		}
	}

	sql this.db {
		insert abbreviation_dbs into LabelAbbreviationDb
	}!
}

@[table: 'label__person']
struct Label_Person {
	label_id  string @[fkey: 'label.id'; required]
	person_id string @[fkey: 'person.id'; required]
}

pub fn (this RepositorySqlite) save_person(person cperson.Person, label Label) ! {
	dbo := Label_Person{
		label_id:  label.id
		person_id: person.id
	}

	sql this.db {
		insert dbo into Label_Person
	}!
}
