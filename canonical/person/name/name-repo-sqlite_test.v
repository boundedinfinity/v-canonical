module name_test

import canonical.person.name
import canonical.id as cid

fn test_name() {
	repo := name.new_repo_sqlite(':memory:') or { panic(err) }
	// repo := name.new_repo_sqlite('names.db') or { panic(err) }
	defer {
		repo.close() or {}
	}

	id := cid.new()

	mut actual := name.Name{
		id:    id
		first: ['John']
		last:  ['Smith']
	}

	repo.save(actual)!

	loaded := repo.get(id)!

	assert actual.fullname() == loaded.fullname()
	assert actual.id == loaded.id
}
