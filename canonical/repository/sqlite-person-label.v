module repository

import canonical.person as cperson
import canonical.label as clabel

pub fn (this PersonSqlite) label(person cperson.Person, label clabel.Label) ! {
	dbo := Person__Label{
		label_id:  label.id
		person_id: person.id
	}

	sql this.db {
		insert dbo into Person__Label
	}!
}
