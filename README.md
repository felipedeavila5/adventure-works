![alt text](https://github.com/felipedeavila5/adventure-works/blob/master/images/stack.png?raw=true)


Projeto Final do Curso de Analytics Engineer da Indicium Academy 
### Adventure Works

Adventure Works é uma indústria de bicicletas. Buscando tomar as
melhores decisões no futuro, a empresa decidiu investir em uma infraestrutura
de analytics visando ser uma empresa data-driven. 


### Solução
Todos os dados da Adventure Works estão em um banco postgressql. 
Então esses dados foram extraidos usando a ferramenta Airbyte
e carregados no Data Warehouse da Google (Big Query). Depois 
dos dados brutos  serem carregados no DW, o DBT fez a
transformação dos dados.  Por fim, foi utilizado o 
Metabase para acessar os dados e criar indicadores de interesse
da Adventure Works


### Links Importantes:

- Diagrama do Banco Relacional [PDF](https://github.com/felipedeavila5/adventure-works/blob/master/documents/db_schema.pdf)
- Diagrama do Data Warehouse [PDF](https://github.com/felipedeavila5/adventure-works/blob/master/documents/dw_schema.pdf)
- BI com os Indicadores [Metabase](https://project-adventure-works.herokuapp.com/public/dashboard/f0944f0a-3b96-491f-b62e-a5097add909e). O link pode demorar um pouco para abrir.

