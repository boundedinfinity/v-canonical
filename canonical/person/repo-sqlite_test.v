module name_test

import canonical.person
import canonical.person.name
import db.sqlite

fn test_name_repository_sqlite() {
	mut db := sqlite.connect(':memory:')!
	repo := person.new_repo_sqlite(db) or { panic(err) }

	defer {
		db.close() or {}
	}

	mut actual := person.Person{
		name: name.Name{
			first: ['John']
			last:  ['Smith']
		}
	}

	repo.save(actual)!

	loaded := repo.get(actual.id)!

	assert actual.id == loaded.id
	assert actual.name.fullname() == loaded.name.fullname()
}


