package main

import (
	"fmt"
	"net/http"
	"rest_api/db"
	"rest_api/handler"
)

type Task struct {
	Id     int    `json:"id"`
	Name   string `json:"name"`
	Status bool   `json:"status"`
}

func main() {
	client := db.NewClient()
	defer client.Close()

	mux := http.NewServeMux()
	mux.HandleFunc("/tasks", handler.GenerateHandler(client))

	fmt.Println("Server on :8080")
	http.ListenAndServe(":8080", mux)
}
