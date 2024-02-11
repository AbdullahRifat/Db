



CREATE TABLE question_one (
  roll INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  department VARCHAR(255) NOT NULL,
  balance DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  grade CHAR(1) NOT NULL CHECK (grade IN ('A', 'B', 'C', 'D', 'E', 'F'))
);



CREATE TABLE passed (
  roll INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  FOREIGN KEY (roll) REFERENCES question_one(roll) ON DELETE RESTRICT ON UPDATE CASCADE
);








DELIMITER //
CREATE TRIGGER insert_passed_on_non_f_grade
AFTER INSERT ON question_one
FOR EACH ROW
BEGIN
  IF NEW.grade != 'F' THEN
    INSERT INTO passed (roll, name) VALUES (NEW.roll, NEW.name);
  END IF;
END;
//
DELIMITER ;





DELIMITER //
CREATE TRIGGER insert_passed_on_non_f_grade
AFTER INSERT ON question_one
FOR EACH ROW
BEGIN
  IF NEW.grade != 'F' THEN
    INSERT INTO passed (roll, name) VALUES (NEW.roll, NEW.name);
  END IF;
END;
//
DELIMITER ;
