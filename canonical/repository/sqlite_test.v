module repository_test

import canonical.repository
import canonical.label
import canonical.person
import canonical.person.name
import db.sqlite

fn test_repository_sqlite__label_repository_sqlite() {
	mut db := sqlite.connect(':memory:')!
	repo := repository.sqlite(db) or { panic(err) }

	defer {
		db.close() or {}
	}

	actuall1 := label1()
	actuall2 := label2()
	actualp1 := person1()

	repo.label().save(actuall1)!
	repo.label().save(actuall2)!
	repo.person().save(actualp1)!

	loadedl1 := repo.label().get(actuall1.id)!

	assert actuall1.id == loadedl1.id
	assert actuall1.name == loadedl1.name
	// assert actuall1.abbreviations? == loadedl1.abbreviations?
	// assert actuall1.description? == loadedl1.description?

	loadedl2 := repo.label().get(actuall2.id)!

	assert actuall2.id == loadedl2.id
	assert actuall2.name == loadedl2.name
	assert actuall2.abbreviations? == loadedl2.abbreviations?
	assert actuall2.description? == loadedl2.description?

	repo.person().save(actualp1)!
	repo.person().label(actualp1, actuall1)!
}

fn person1() person.Person {
	return person.Person{
		name: name.Name{
			first: ['John']
			last:  ['Smith']
		}
	}
}

fn label1() label.Label {
	return label.Label{
		name: 'Family'
	}
}

fn label2() label.Label {
	return label.Label{
		name:          'Friend of a Friend'
		abbreviations: ['FOAF']
		description:   'A person known by a friend'
	}
}

