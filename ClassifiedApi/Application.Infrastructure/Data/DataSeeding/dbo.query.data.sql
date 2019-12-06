;WITH x AS
(
  SELECT *, 
    rn = ROW_NUMBER() OVER 
    (
        PARTITION BY id 
        ORDER BY imageId
    )
  FROM AdView
)
SELECT * FROM x WHERE rn = 1;

//to get last inserted id
SELECT SCOPE_IDENTITY()
or
SELECT IDENT_CURRENT('Ad');