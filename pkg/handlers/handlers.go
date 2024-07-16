package handlers

import (
	"fmt"
	"net/http"
	"net/url"
	"strconv"
)

func MyHandler(response http.ResponseWriter, request *http.Request) {
	result := getSum(request)
	fmt.Fprintf(response, "Dear visitor! The sum is: %v", result)

}

func getSum(request *http.Request) int {
	params := request.URL.Query()

	return getNumber(params, "a") + getNumber(params, "b")
}

func getNumber(params url.Values, paramName string) int {
	paramValue := params.Get(paramName)

	if paramValue == "" {
		paramValue = "0"
	}

	number, err := strconv.Atoi(paramValue)
	if err != nil {
		fmt.Println(err)
	}

	return number
}
