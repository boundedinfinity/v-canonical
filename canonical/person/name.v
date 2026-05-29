module person

import canonical.id

pub struct Name {
pub mut:
	id     id.Id
	first  ?[]string
	middle ?[]string
	last   ?[]string
}

pub fn (this Name) fullname() string {
	mut full_names := []string{}

	add := fn (mut full_names []string, names ?[]string) {
		if ns := names {
			if ns.len > 0 {
				full_names << ns.join(' ')
			}
		}
	}

	add(mut full_names, this.first)
	add(mut full_names, this.middle)
	add(mut full_names, this.last)

	return full_names.join(' ')
}

pub struct NameFormatter {
pub:
	pattern string
}
