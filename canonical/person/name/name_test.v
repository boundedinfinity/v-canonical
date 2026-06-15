module name_test

import canonical.person.name
import canonical.id as cid

fn test_name() {
	id := cid.new()

	mut actual := name.Name{
		id:    id
		first: ['John']
		last:  ['Smith']
	}

	assert actual.fullname() == 'John Smith'
	assert actual.id.len == 36

	actual.add_first('X')
	assert actual.fullname() == 'John X Smith'
}
