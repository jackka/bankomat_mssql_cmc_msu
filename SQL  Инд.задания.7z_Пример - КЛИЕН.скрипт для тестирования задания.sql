Тестирование созданных объектов в БД

-----------------

/* СОздать связь между объектами Person Гончрова и Person Пушкин*/

EXEC Relation ('Гончарова','Пушкин', 20 )

-----------------

/* Показать всех детей .... */

SELECT ...   -- выборки из VIEW

-----------------

В тексте хранимых процедур возможны операторы выбора (IF-ELSE, CASE)
и операторы цикла WHILE.

IF ...
   BEGIN
       ...
       ...
       ...

   END
ELSE
   BEGIN
       ...
       ...
       ...

   END


DECLARE @vasya varchar(50)


CREATE PROC Relation (@Person1 char(50), @Person2, char(50), )
AS


DECLARE @FamilyIdSearch smallint
SELECT @FamilyIdSearch = FamilyIdSearch, col2, col3
FROM Family
WHERE ...

