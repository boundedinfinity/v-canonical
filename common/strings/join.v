module strings

import arrays

pub fn join(s []string, sep string) string {
	return arrays.join_to_string(s, sep, |s| s)
}
