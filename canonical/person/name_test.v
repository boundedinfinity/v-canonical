module person_test

import canonical.person
import canonical.id

fn test_name() {
	aid := id.new()

	mut actual := person.Name{
		id:    aid
		first: ['John']
		last:  ['Smith']
	}

	assert actual.fullname() == 'John Smith'
	assert actual.id.len == 36

	actual.add_first('X')
	assert actual.fullname() == 'John X Smith'
}



