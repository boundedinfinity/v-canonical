module repository

import canonical.id as cid
import canonical.label as clabel
import db.sqlite

struct LabelSqlite {
mut:
	db sqlite.DB
}

pub fn (this LabelSqlite) get(id cid.Id) !clabel.Label {
	label_dbs := sql this.db {
		select from LabelDb where id == id
	}!

	if label_dbs.len < 1 {
		return error('label ${id} not found')
	}

	if label_dbs.len > 1 {
		return error('label ${id} found duplicates')
	}

	mut label := clabel.Label{
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

pub fn (this LabelSqlite) save(label clabel.Label) ! {
	db := LabelDb{
		id:          label.id
		name:        label.name
		description: label.description
	}

	sql this.db {
		insert db into LabelDb
	}!

	mut abbreviation_dbs := []LabelAbbreviationDb{}

	for i, abbreviation in label.abbreviations {
		abbreviation_dbs << LabelAbbreviationDb{
			label_id:     label.id
			index:        i
			abbreviation: abbreviation
		}
	}

	sql this.db {
		insert abbreviation_dbs into LabelAbbreviationDb
	}!
}
