module label

import canonical.id as cid
import db.sqlite

pub fn new_repo_sqlite(path string) !&LabelRepositorySqlite {
	db := sqlite.connect(path)!

	sql db {
		create table LabelDb
		create table LabelAbbreviationDb
	}!

	return &LabelRepositorySqlite{
		db: db
	}
}

struct LabelRepositorySqlite {
mut:
	db sqlite.DB
}

pub fn (mut this LabelRepositorySqlite) close() ! {
	this.db.close()!
}

pub fn (this LabelRepositorySqlite) get(id cid.Id) !Label {
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

pub fn (this LabelRepositorySqlite) save(label Label) ! {
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

@[table: 'label']
struct LabelDb {
	id          string @[required]
	name        string @[required]
	description ?string
}

@[table: 'label__abbreviation']
struct LabelAbbreviationDb {
	label_id     string @[required]
	index        int    @[required]
	abbreviation string @[required]
}

