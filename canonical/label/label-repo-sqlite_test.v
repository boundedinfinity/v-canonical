module label_test

import canonical.label
import db.sqlite

fn test_label_repository_sqlite() {
	mut db := sqlite.connect(':memory:')!
	repo := label.new_repo_sqlite(db) or { panic(err) }

	defer {
		db.close() or {}
	}

	mut actual := label.Label{
		name:          'Database'
		abbreviations: ['DB']
		description:   'A database'
	}

	repo.save(actual)!

	loaded := repo.get(actual.id)!

	assert actual.id == loaded.id
	assert actual.name == loaded.name
	assert actual.abbreviations?.len == loaded.abbreviations?.len
	assert actual.abbreviations == loaded.abbreviations
	assert actual.description? == loaded.description?
}

