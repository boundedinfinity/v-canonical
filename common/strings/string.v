module strings

pub fn uncapitalize(s string) string {
	match s.len {
		0 { return s }
		1 { return s.to_lower() }
		else { return s[..1].to_lower() + s[1..] }
	}
}
