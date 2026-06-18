module label_test

import canonical.label
import canonical.person
import canonical.person.name
import db.sqlite

fn test_label_repository_sqlite() {
	mut db := sqlite.connect(':memory:')!
	lrepo := label.new_repo_sqlite(db) or { panic(err) }
	prepo := person.new_repo_sqlite(db) or { panic(err) }

	defer {
		db.close() or {}
	}

	clabel := label.Label{
		name:          'Database'
		abbreviations: ['DB']
		description:   'A database'
	}

	

	lrepo.save(clabel)!
	

	loaded := lrepo.get(clabel.id)!

	assert clabel.id == loaded.id
	assert clabel.name == loaded.name
	assert clabel.abbreviations?.len == loaded.abbreviations?.len
	assert clabel.abbreviations == loaded.abbreviations
	assert clabel.description? == loaded.description?

	cperson := person.Person{
		name: name.Name{
			first: ['John']
			last:  ['Smith']
		}
	}

	prepo.save(cperson)!
	lrepo.save_person(cperson, clabel)!
}
