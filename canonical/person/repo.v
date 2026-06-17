module person

import canonical.id

pub interface Repository {
	get(id.Id) !Person
	save(Person) !
}
