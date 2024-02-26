--Function
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N= N-1;
  RETURN (
      IFNULL((SELECT DISTINCT salary FROM Employee ORDER BY salary DESC LIMIT N, 1),NULL)
      
       );
END

--Stored Procedure 

DELIMITER //

CREATE PROCEDURE getNthHighestSalaryProc(IN N INT, OUT result INT)
BEGIN
    SET N = N - 1; 
    SELECT IFNULL((SELECT DISTINCT salary FROM Employee ORDER BY salary DESC LIMIT N, 1), NULL) INTO result;
END//

DELIMITER ;

--Ejemplo de uso

-- Llamas al procedimiento almacenado para obtener el salario del quinto empleado más alto y lo guardas en la variable @salary
CALL getNthHighestSalaryProc(5, @salary);

-- Insertas el valor de @salary en la tabla HighestSalaries
INSERT INTO HighestSalaries (salary) VALUES (@salary);