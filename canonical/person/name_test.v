module person_test

import canonical.person

fn test_name_fullname() {
	name1 := person.Name{
		first: ['John']
		last:  ['Smith']
	}

	assert name1.fullname() == 'John Smith'
}
