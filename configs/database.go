package configs

import (
	"fmt"
	"go-backend-test/models"
	"log"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var DB *gorm.DB

func ConnectDB() {
	connection := fmt.Sprintf(
		"%v:%v@tcp(%v:%v)/%v?parseTime=true&loc=Asia%%2FJakarta",
		ENV.DB_USER,
		ENV.DB_PASSWORD,
		ENV.DB_HOST,
		ENV.DB_PORT,
		ENV.DB_DATABASE,
	)

	db, err := gorm.Open(mysql.Open(connection), &gorm.Config{})
	if err != nil {
		log.Fatalf("Failed to connect database :  %v", err)
	}

	db.AutoMigrate(&models.Posts{})
	DB = db
	log.Println("Database Connected!")
}
