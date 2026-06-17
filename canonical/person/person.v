module person

import canonical.person.name
import canonical.id

pub struct Person {
pub:
	id id.Id = id.new() @[required]
pub mut:
	name name.Name
}
