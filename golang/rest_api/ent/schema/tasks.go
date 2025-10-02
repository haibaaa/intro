package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/schema/field"
)

// Tasks holds the schema definition for the Tasks entity.
type Tasks struct {
	ent.Schema
}

// Fields of the Tasks.
func (Tasks) Fields() []ent.Field {
	return []ent.Field{
		field.Int("id"),
		field.Text("taskName"),
		field.Bool("status"),
	}
}

// Edges of the Tasks.
func (Tasks) Edges() []ent.Edge {
	return nil
}
