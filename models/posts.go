package models

import "time"

type Posts struct {
	ID          int       `gorm:"primaryKey" json:"id"`
	Title       string    `gorm:"type:varchar(200)" json:"title" validate:"required,min=20"`
	Content     string    `gorm:"type:text" json:"content" validate:"required,min=200"`
	Category    string    `gorm:"type:varchar(100)" json:"category" validate:"required,min=3"`
	Status      string    `gorm:"type:varchar(100)" json:"status" validate:"required,status"`
	CreatedDate time.Time `json:"created_date"`
	UpdatedDate time.Time `json:"updated_date"`
}
