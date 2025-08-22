package main

import (
	"fmt"
	"go-backend-test/configs"
	"go-backend-test/routes"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	configs.LoadConfig()
	configs.ConnectDB()

	r := mux.NewRouter()
	routes.RouteIndex(r)

	log.Println("Server running on port", configs.ENV.PORT)
	http.ListenAndServe(fmt.Sprintf(":%v", configs.ENV.PORT), r)
}
