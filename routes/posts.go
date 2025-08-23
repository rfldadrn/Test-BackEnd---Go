package routes

import (
	"go-backend-test/controllers/postscontroller"

	"github.com/gorilla/mux"
)

func PostsRoutes(r *mux.Router) {
	router := r.PathPrefix("/article").Subrouter()

	router.HandleFunc("/{limit}/{offset}", postscontroller.Index).Methods("GET") //View
	router.HandleFunc("/{id}", postscontroller.Detail).Methods("GET")            //Detail
	router.HandleFunc("", postscontroller.Create).Methods("POST")                //Create
	router.HandleFunc("/{id}", postscontroller.Update).Methods("PUT")            //Create
	router.HandleFunc("/{id}", postscontroller.Delete).Methods("DELETE")

	//Tambahan untuk kebutuhan integrasi FrontEnd
	router.HandleFunc("/view/{status}/{limit}/{offset}", postscontroller.View).Methods("GET") //View
}
