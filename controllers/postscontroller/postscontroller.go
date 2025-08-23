package postscontroller

import (
	"encoding/json"
	"errors"
	"fmt"
	"go-backend-test/configs"
	"go-backend-test/helpers"
	"go-backend-test/models"
	"net/http"
	"strconv"
	"strings"
	"time"

	"github.com/go-playground/validator/v10"
	"github.com/gorilla/mux"
	"gorm.io/gorm"
)

func Index(w http.ResponseWriter, r *http.Request) {
	var posts []models.Posts

	// Ambil parameter path
	vars := mux.Vars(r)
	limitStr := vars["limit"]
	offsetStr := vars["offset"]

	// Check and convert paramter
	limit, err := strconv.Atoi(limitStr)
	if err != nil || limit <= 0 {
		limit = 10 //default
	}
	offset, err := strconv.Atoi(offsetStr)
	if err != nil || offset < 0 {
		offset = 0
	}

	// Get Data
	if err := configs.DB.Limit(limit).Offset(offset).Find(&posts).Error; err != nil {
		helpers.Response(w, 500, err.Error(), nil)
		return
	}

	helpers.Response(w, 200, "List Posts", posts)
}

// Tambahan untuk kebutuhan FE
func View(w http.ResponseWriter, r *http.Request) {
	var posts []models.Posts

	// Ambil parameter path
	vars := mux.Vars(r)
	statusStr := vars["status"]
	limitStr := vars["limit"]
	offsetStr := vars["offset"]

	// Check and convert paramter
	limit, err := strconv.Atoi(limitStr)
	if err != nil || limit <= 0 {
		limit = 10 //default
	}
	offset, err := strconv.Atoi(offsetStr)
	if err != nil || offset < 0 {
		offset = 0
	}

	// Get Data
	if err := configs.DB.Where("status = ?", statusStr).Limit(limit).Offset(offset).Find(&posts).Error; err != nil {
		helpers.Response(w, 500, err.Error(), nil)
		return
	}

	helpers.Response(w, 200, "List Posts", posts)
}

func Create(w http.ResponseWriter, r *http.Request) {
	var posts models.Posts

	// Tangkap req body
	if err := json.NewDecoder(r.Body).Decode(&posts); err != nil {
		helpers.Response(w, 500, err.Error(), nil)
		return //stop
	}

	// Tutup
	defer r.Body.Close()

	// Validation Input
	validate := validator.New()

	validate.RegisterValidation("status", func(fl validator.FieldLevel) bool {
		status := strings.ToLower(fl.Field().String())
		return status == "publish" || status == "draft" || status == "thrash"
	})

	if err := validate.Struct(posts); err != nil {
		var errors []string
		for _, err := range err.(validator.ValidationErrors) {
			field := err.Field()
			tag := err.Tag()
			var msg string

			switch field {
			case "Title":
				msg = "Title wajib diisi dan minimal 20 karakter"
			case "Content":
				msg = "Content wajib diisi dan minimal 200 karakter"
			case "Category":
				msg = "Category wajib diisi dan minimal 3 karakter"
			case "Status":
				msg = "Status wajib diisi dan harus bernilai 'publish', 'draft', atau 'thrash'"
			default:
				msg = fmt.Sprintf("Field '%s' gagal pada rule '%s'", field, tag)
			}

			errors = append(errors, msg)
		}
		helpers.Response(w, 422, "Validasi gagal", errors)
		return
	}

	// Set Value
	posts.Status = strings.ToLower(posts.Status)
	posts.CreatedDate = time.Now()

	// Function bawaan GORM
	if err := configs.DB.Create(&posts).Error; err != nil {
		helpers.Response(w, 500, err.Error(), nil)
		return //stop
	}

	helpers.Response(w, 201, "Success create Post", nil)
}

func Detail(w http.ResponseWriter, r *http.Request) {
	idParam := mux.Vars(r)["id"]
	id, _ := strconv.Atoi(idParam)

	var posts models.Posts

	if err := configs.DB.First(&posts, id).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			helpers.Response(w, 404, "Post Not Found!", nil)
			return
		}

		helpers.Response(w, 500, err.Error(), nil)
		return
	}
	helpers.Response(w, 200, "Detail Author", posts)
}

func Update(w http.ResponseWriter, r *http.Request) {
	idParam := mux.Vars(r)["id"]
	id, _ := strconv.Atoi(idParam)

	var post models.Posts

	if err := configs.DB.First(&post, id).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			helpers.Response(w, 404, "Post not found!", nil)
			return
		}

		helpers.Response(w, 500, err.Error(), nil)
		return
	}

	if err := json.NewDecoder(r.Body).Decode(&post); err != nil {
		helpers.Response(w, 500, err.Error(), nil)
		return
	}

	defer r.Body.Close()

	// Validation input
	// Validation Input
	validate := validator.New()
	validate.RegisterValidation("status", func(fl validator.FieldLevel) bool {
		status := strings.ToLower(fl.Field().String())
		return status == "publish" || status == "draft" || status == "thrash"
	})

	if err := validate.Struct(post); err != nil {
		var errors []string
		for _, err := range err.(validator.ValidationErrors) {
			field := err.Field()
			tag := err.Tag()
			var msg string

			switch field {
			case "Title":
				msg = "Title wajib diisi dan minimal 20 karakter"
			case "Content":
				msg = "Content wajib diisi dan minimal 200 karakter"
			case "Category":
				msg = "Category wajib diisi dan minimal 3 karakter"
			case "Status":
				msg = "Status wajib diisi dan harus bernilai 'publish', 'draft', atau 'thrash'"
			default:
				msg = fmt.Sprintf("Field '%s' gagal pada rule '%s'", field, tag)
			}

			errors = append(errors, msg)
		}
		helpers.Response(w, 422, "Validasi gagal", errors)
		return
	}

	post.Status = strings.ToLower(post.Status)
	post.UpdatedDate = time.Now()

	if err := configs.DB.Where("id = ?", id).Updates(&post).Error; err != nil {
		helpers.Response(w, 500, err.Error(), nil)
		return
	}

	helpers.Response(w, 201, "Success Update Post", nil)
}

func Delete(w http.ResponseWriter, r *http.Request) {
	idParam := mux.Vars(r)["id"]

	id, _ := strconv.Atoi(idParam)

	var post models.Posts
	res := configs.DB.Delete(&post, id)
	if res.Error != nil {
		helpers.Response(w, 500, res.Error.Error(), nil)
		return
	}

	if res.RowsAffected == 0 {
		helpers.Response(w, 404, "Post not found!", nil)
		return
	}

	helpers.Response(w, 200, "Success delete post", nil)
}
