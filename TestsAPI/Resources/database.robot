*** Settings ***
Documentation       Database helpers connection

Library             RobotMongoDBLibrary.Delete
Library             RobotMongoDBLibrary.Find


*** Variables ***
&{MONGO_URI}        connection=mongodb+srv://bugereates:AFUB3uVt5exShGsp@cluster0.ivqe9.mongodb.net/PartnerDB?retryWrites=true&w=majority
...                 database=PartnerDB
...                 collection=partner
