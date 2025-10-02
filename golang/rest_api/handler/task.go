package handler

import (
	"context"
	"encoding/json"
	"net/http"
	"rest_api/ent"
)

func GenerateHandler(client *ent.Client) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		switch r.Method {
		case http.MethodGet:
			tasks, err := client.Tasks.Query().All(context.Background())
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
			}
			json.NewEncoder(w).Encode(tasks)

		case http.MethodPost:
			var input struct {
				Name string `json:"name"`
			}

			if err := json.NewDecoder(r.Body).Decode(&input); err != nil {
				http.Error(w, err.Error(), http.StatusBadRequest)
			}

			task, err := client.Tasks.Create().SetTaskName(input.Name).SetStatus(false).Save(r.Context())
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
			}
			json.NewEncoder(w).Encode(task)
		}

	}
}
