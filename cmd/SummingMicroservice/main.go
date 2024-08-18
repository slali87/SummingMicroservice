package main

import (
	"flag"
	"fmt"
	"net/http"

	"github.com/slali87/SummingMicroservice/pkg/handlers"
)

const (
	defaultAddress string = "0.0.0.0"
	defaultPort    int    = 80
)

var (
	address string
	port    int
)

func main() {
	flag.StringVar(&address, "addr", defaultAddress, "Server's address")
	flag.IntVar(&port, "port", defaultPort, "Server's port")
	flag.Parse()
	runService()
}

func runService() {
	fullAddress := fmt.Sprintf("%s:%d", address, port)

	fmt.Printf("\nServer is running on %s", fullAddress)
	
	// Add index.html file as GUI
	fileserver := http.FileServer(http.Dir("./html"))
	http.Handle("/", fileserver)

	http.HandleFunc("/sum", handlers.MyHandler)
	http.ListenAndServe(fullAddress, nil)
}
