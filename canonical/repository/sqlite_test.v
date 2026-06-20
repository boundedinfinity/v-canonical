module repository_test

import canonical.repository
import canonical.label
import canonical.person
import canonical.person.name
import db.sqlite

fn test_repository_sqlite__label_repository_sqlite() {
	mut db := sqlite.connect(':memory:')!
	repo := repository.sqlite(db) or { panic(err) }
	helper := Helper{}

	defer {
		db.close() or {}
	}

	repo.label().save(helper.label1)!
	repo.label().save(helper.label2)!
	repo.person().save(helper.person1)!

	loadedl1 := repo.label().get(helper.label1.id)!

	assert helper.label1.id == loadedl1.id
	assert helper.label1.name == loadedl1.name
	// assert helper.label1.abbreviations? == loadedl1.abbreviations?
	// assert helper.label1.description? == loadedl1.description?

	loadedl2 := repo.label().get(helper.label2.id)!

	assert helper.label2.id == loadedl2.id
	assert helper.label2.name == loadedl2.name
	assert helper.label2.abbreviations? == loadedl2.abbreviations?
	assert helper.label2.description? == loadedl2.description?

	repo.person().save(helper.person1)!
	repo.person().label(helper.person1, helper.label1)!
}

// ////////////////////////////////////////////////////////////////////////////////////////////////

struct Helper {
	person1 person.Person = person.Person{
		name: name.Name{
			first: ['John']
			last:  ['Smith']
		}
	}

	label1 label.Label = label.Label{
		name: 'Family'
	}

	label2 label.Label = label.Label{
		name:          'Friend of a Friend'
		abbreviations: ['FOAF']
		description:   'A person known by a friend'
	}

	label_group1 label.LabelGroup = label.LabelGroup{
		name: 'Relatives'
	}
}
