module repository

import db.sqlite as nsqlite

pub fn sqlite(db nsqlite.DB) !&SqliteRepository {
	sql db {
		create table LabelDb
		create table LabelAbbreviationDb
		create table LabelGroupDb
		create table LabelGroupAbbreviationDb
		create table LabelGroup__Label
		create table PersonDb
		create table Person__NameDb
		create table Person__Name__FirstDb
		create table Person__Name__MiddleDb
		create table Person__Name__LastDb
		create table Person__Label
	}!

	return &SqliteRepository{
		db: db
	}
}

struct SqliteRepository {
mut:
	db nsqlite.DB
}

pub fn (this SqliteRepository) label() LabelSqlite {
	return LabelSqlite{
		db: this.db
	}
}

pub fn (this SqliteRepository) person() PersonSqlite {
	return PersonSqlite{
		db: this.db
	}
}
