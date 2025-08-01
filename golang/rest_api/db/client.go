package db

import (
	"context"
	"entgo.io/ent/dialect"
	_ "github.com/mattn/go-sqlite3"
	"log"
	"rest_api/ent"
)

func NewClient() *ent.Client {
	client, err := ent.Open(dialect.SQLite, "file:tasks.do?_fk=1")
	if err != nil {
		log.Fatalf("you dun fucked up [SQLite ver], %v", err)
	}

	if err := client.Schema.Create(context.Background()); err != nil {
		log.Fatalf("you dun fucked up [Schema ver], %v", err)
	}

	return client
}
