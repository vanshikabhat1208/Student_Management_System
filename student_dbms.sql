<?php

// Connect to MySQL database
$host = "localhost";
$username = "root"; 
$password = "";
$db = "students_db";

$conn = mysqli_connect($host, $username, $password, $db);

if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

// Get all students
function getStudents() {
  global $conn;
  $query = "SELECT * FROM students";
  $result = mysqli_query($conn, $query);
  
  while($row = mysqli_fetch_assoc($result)) {
    $students[] = $row; 
  }
  
  return $students;
}

// Get single student
function getStudentById($id) {
  global $conn;
  $query = "SELECT * FROM students WHERE student_id=" . $id;
  $result = mysqli_query($conn, $query);
  
  return mysqli_fetch_assoc($result);
}  

// Insert new student
function insertStudent($firstName, $lastName, $dob, $address, $phone, $email) {
  global $conn;
  $query = "INSERT INTO students (first_name, last_name, dob, address, phone, email) 
            VALUES ('$firstName', '$lastName', '$dob', '$address', '$phone', '$email')";
            
  if(mysqli_query($conn, $query)) {
    return true;
  } else {
    return false;
  }
}

// Update student
function updateStudent($id, $firstName, $lastName, $dob, $address, $phone, $email) {
  global $conn;
  $query = "UPDATE students SET first_name='$firstName', last_name='$lastName', 
            dob='$dob', address='$address', phone='$phone', email='$email'
            WHERE student_id=$id";
            
  if(mysqli_query($conn, $query)) {
    return true;
  } else {
    return false; 
  }
}

// Delete student
function deleteStudent($id) {
  global $conn;
  $query = "DELETE FROM students WHERE student_id=$id";
  
  if(mysqli_query($conn, $query)) {
    return true;
  } else {
    return false;
  }
}

?>