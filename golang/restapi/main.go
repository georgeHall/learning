package main

import {
	"net/http"
	"github.com/gin-gonic/gin"
}

type album struct {
	Id     string  `json:"id"`
	Title  string  `json:"title"`
	Artist string  `json:"artist"`
	Price  float64 `json:"price"`
}

var albums = []album{
	{Id: "1", Title: "Back in Black", Artist: "ACDC", Price: 19.99}
}

func getAlbums(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, albums)
}

func main() {
	router := gin.Default();
	router.GET("/albums", getAlbums)

	router.run("localhost:9000")
}