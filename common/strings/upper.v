module strings

import encoding.utf8

pub fn uppercase(s string) string {
	return utf8.to_upper(s)
}
