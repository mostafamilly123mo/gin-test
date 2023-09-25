package services

import "gin-project/models"

type UserService interface {
	CreateUser(*models.User) error
	GetUser(*string) (*models.User, error)
	GetAll() ([]*models.User, error)
	UpdateUser(*models.User) error
	DeleteUser(*string) error
	RegisterUser(*models.User) error
	GenerateToken(username, password string) (string, error)
}
