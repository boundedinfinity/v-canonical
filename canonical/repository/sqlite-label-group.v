module repository

import canonical.id as cid
import canonical.label as clabel
import db.sqlite

struct LabelGroupSqlite {
mut:
	db sqlite.DB
}

pub fn (this LabelGroupSqlite) get(id cid.Id) !clabel.LabelGroup {
	label_dbs := sql this.db {
		select from LabelGroupDb where id == id
	}!

	if label_dbs.len < 1 {
		return error('label group ${id} not found')
	}

	if label_dbs.len > 1 {
		return error('label group ${id} found duplicates')
	}

	mut label := clabel.LabelGroup{
		id:          id
		name:        label_dbs[0].name
		description: label_dbs[0].description
	}

	abbreviations := sql this.db {
		select from LabelGroupAbbreviationDb where label_group_id == id order by index
	}!.map(|row| row.abbreviation)

	if abbreviations.len > 0 {
		label.abbreviations = abbreviations
	}

	return label
}

pub fn (this LabelGroupSqlite) save(group clabel.LabelGroup) ! {
	db := LabelGroupDb{
		id:          group.id
		name:        group.name
		description: group.description
	}

	sql this.db {
		insert db into LabelGroupDb
	}!

	mut abbreviation_dbs := []LabelGroupAbbreviationDb{}

	for i, abbreviation in group.abbreviations {
		abbreviation_dbs << LabelGroupAbbreviationDb{
			label_group_id: group.id
			index:          i
			abbreviation:   abbreviation
		}
	}

	sql this.db {
		insert abbreviation_dbs into LabelGroupAbbreviationDb
	}!

	if labels := group.labels {
		mut label_group__label_dbs := []LabelGroup__Label{}

		for label in labels {
			label_group__label_dbs << LabelGroup__Label{
				label_group_id: group.id
				label_id:       label.id
			}
		}

		sql this.db {
			insert label_group__label_dbs into LabelGroup__Label
		}!
	}
}
