CREATE DATABASE IF NOT EXISTS kin_project
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE kin_project;

CREATE TABLE kin_question (
    k_id        INT AUTO_INCREMENT PRIMARY KEY, 
    title       VARCHAR(255)    NOT NULL, 
    url         VARCHAR(500)    NOT NULL,     
    q_content   TEXT            NULL,        
    q_date      DATE            NULL,          
    q_category  VARCHAR(255)    NULL,         
    created_at  DATETIME        DEFAULT CURRENT_TIMESTAMP 
);
