-- https://leetcode.com/problems/product-sales-analysis-iii/?envType=study-plan-v2&envId=top-sql-50
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) in (
    SELECT product_id, MIN(year) 
    FROM Sales
    GROUP BY product_id
)

/*Este me parecio interesante,tenía un concepto erroneo de group by y con esto pude aclararlo.
Cuando utilizo GROUP BY, las columnas que no estan afectadas, si yo no utilizo ningun metodo
para determinar que voy a hacer con ellas, "quedan todas juntas" y SQL en sí, no sabría cual
elegir si yo le pido seleccionar, no es que por ser el menor año me va a seleccionar la primera
por eso hago una subconsulta, para matchear valores los cuales si estaran conectadas con las
otras columnas.
