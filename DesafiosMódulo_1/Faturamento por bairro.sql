/*Desafio: faturamento por bairro*/
CREATE FUNCTION FaturamentoBairro (@BAIRRO VARCHAR(50))
RETURNS FLOAT
AS
BEGIN
   DECLARE @FATURAMENTO FLOAT
   SELECT @FATURAMENTO = SUM([ITENS NOTAS FISCAIS].QUANTIDADE * [ITENS NOTAS FISCAIS].[PRE�O])
   FROM [ITENS NOTAS FISCAIS] 
   INNER JOIN [NOTAS FISCAIS]
   ON [ITENS NOTAS FISCAIS].NUMERO = [NOTAS FISCAIS].NUMERO
   INNER JOIN [TABELA DE CLIENTES] 
   ON [TABELA DE CLIENTES].CPF = [NOTAS FISCAIS].CPF
   WHERE [TABELA DE CLIENTES].BAIRRO = @BAIRRO
   RETURN @FATURAMENTO
END;


SELECT dbo.FaturamentoBairro ('�gua Santa')