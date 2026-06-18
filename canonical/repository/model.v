module repository

// ////////////////////////////////////////////////////////////////////////////////////////////////

@[table: 'label']
struct LabelDb {
	id          string @[required]
	name        string @[required]
	description ?string
}

@[table: 'label__abbreviation']
struct LabelAbbreviationDb {
	label_id     string @[fkey: 'label.id'; required]
	index        int    @[required]
	abbreviation string @[required]
}

// ////////////////////////////////////////////////////////////////////////////////////////////////

@[table: 'label_group']
struct LabelGroupDb {
	id          string @[required]
	name        string @[required]
	description ?string
}

@[table: 'label_group__abbreviation']
struct LabelGroupAbbreviationDb {
	label_group_id string @[fkey: 'label_group.id'; required]
	index          int    @[required]
	abbreviation   string @[required]
}

@[table: 'label_group__label']
struct LabelGroup__Label {
	label_group_id string @[fkey: 'label_group.id'; required]
	label_id       string @[fkey: 'label.id'; required]
}

// ////////////////////////////////////////////////////////////////////////////////////////////////

@[table: 'person']
struct PersonDb {
	id      string @[required]
	name_id string @[fkey: 'person_name.id'; required]
}

@[table: 'person_name']
struct Person__NameDb {
pub:
	id string @[required]
}

@[table: 'person_name__first']
struct Person__Name__FirstDb {
	person_id string @[fkey: 'person_name.id'; required]
	index     int    @[required]
	name      string @[required]
}

@[table: 'person_name__middle']
struct Person__Name__MiddleDb {
	person_id string @[fkey: 'person_name.id'; required]
	index     int    @[required]
	name      string @[required]
}

@[table: 'person_name__last']
struct Person__Name__LastDb {
	person_id string @[fkey: 'person_name.id'; required]
	index     int    @[required]
	name      string @[required]
}

@[table: 'person__label']
struct Person__Label {
	label_id  string @[fkey: 'label.id'; required]
	person_id string @[fkey: 'person.id'; required]
}

////////////////////////////////////////////////////////////////////////////////////////////////
