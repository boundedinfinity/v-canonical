module strings

import encoding.utf8

pub fn lowercase(s string) string {
	return utf8.to_lower(s)
}
