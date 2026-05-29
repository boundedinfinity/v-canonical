module person

import common.strings
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
				full_names << strings.join(ns, ' ')
			}
		}
	}

	add(mut full_names, this.first)
	add(mut full_names, this.middle)
	add(mut full_names, this.last)

	return strings.join(full_names, ' ')
}

pub struct NameFormatter {
pub:
	pattern string
}
