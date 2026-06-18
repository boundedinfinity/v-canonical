module person

import canonical.id
import canonical.person.name

pub struct Person {
pub:
	id id.Id = id.new() @[required]
pub mut:
	name name.Name
}
