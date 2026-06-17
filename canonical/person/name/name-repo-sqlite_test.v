module name_test

import canonical.person.name
import db.sqlite

fn test_name_repository_sqlite() {
	mut db := sqlite.connect(':memory:')!
	repo := name.new_repo_sqlite(db) or { panic(err) }

	defer {
		db.close() or {}
	}

	mut actual := name.Name{
		first: ['John']
		last:  ['Smith']
	}

	repo.save(actual)!

	loaded := repo.get(actual.id)!

	assert actual.fullname() == loaded.fullname()
	assert actual.id == loaded.id
}
