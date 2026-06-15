module name

import canonical.id as cid

pub struct Name {
pub:
	id cid.Id = cid.new()
pub mut:
	first  []string = []
	middle []string = []
	last   []string = []
}

fn add_name(mut names []string, name string) {
	if name !in names {
		names << name
	}
}

pub fn (mut this Name) add_first(name string) {
	add_name(mut this.first, name)
}

pub fn (mut this Name) add_middle(name string) {
	add_name(mut this.middle, name)
}

pub fn (mut this Name) add_last(name string) {
	add_name(mut this.last, name)
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


