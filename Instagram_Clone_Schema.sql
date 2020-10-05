DROP DATABASE ig_clone; 
CREATE DATABASE ig_clone; 
use ig_clone; 


CREATE TABLE users (
    id int AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
); 

CREATE TABLE photos (
    id int AUTO_INCREMENT PRIMARY KEY, 
    image_url VARCHAR(255) NOT NULL, 
    user_id int NOT NULL, 
    created_at TIMESTAMP DEFAULT NOW(), 
    FOREIGN KEY(user_id) REFERENCES users(id)
); 

CREATE TABLE comments (
    id int AUTO_INCREMENT PRIMARY KEY, 
    comment_text VARCHAR(255) NOT NULL, 
    user_id int NOT NULL, 
    photo_id int NOT NULL, 
    created_at TIMESTAMP DEFAULT NOW(), 
    FOREIGN KEY(user_id) REFERENCES users(id), 
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);

CREATE TABLE likes (
    user_id int NOT NULL, 
    photo_id int NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(), 
    FOREIGN KEY(user_id) REFERENCES users(id), 
    FOREIGN KEY(photo_id) REFERENCES photos(id), 
    PRIMARY KEY(user_id, photo_id)
); 

CREATE TABLE follows (
   follower_id int NOT NULL, 
   followee_id int NOT NULL, 
   create_at TIMESTAMP DEFAULT NOW(), 
   FOREIGN KEY(follower_id) REFERENCES users(id), 
   FOREIGN KEY(followee_id) REFERENCES users(id), 
   PRIMARY KEY(follower_id, followee_id)
    
); 

CREATE TABLE tags (
    id int AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE, 
    created_at TIMESTAMP DEFAULT NOW()
    
); 

CREATE TABLE photo_tags (
   photo_id int NOT NULL, 
   tag_id int NOT NULL, 
   FOREIGN KEY(photo_id) REFERENCES photos(id), 
   FOREIGN KEY(tag_id) REFERENCES tags(id) 
); 