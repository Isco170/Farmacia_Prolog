if_else(Q,V,F):- Q,!,V.
if_else(Q,V,F):- F.


:- dynamic produto/3.
%produto(Nome,Desc,Quant).

adicionarProduto(produto(N,D,Q)):- assertz(produto(N,D,Q)).
adicionarProduto:-
    write("Digite o nome do produto: "), read(Nome),
    write("Digite a descricao: "), read(Desc),
    write("E sua quantidade: "), read(Quant),

    if_else((Quant=<0),((write("Quantidade invalida"),nl,write("Quantidade certa: "),read(Q),assertz(produto(Nome,Desc,Q)))),
             (write("Falso"),assertz(produto(Nome,Desc,Quant)))).


removerProduto:- write("Digite o nome do produto: "), read(Nome),retract(produto(Nome,_,_)).

listaProdutos:- listing(produto).

:- dynamic funcionario/3.

cadastrarFuncionario:-
    write("Digite o nome do funcionario: "), read(Nome),
    write("Digite o usuario para "),write(Usuario),write(": "), read(Usuario),
    write("Digite a respetiva senha: "), read(Senha),
    assertz(funcionario(Nome,Usuario,Senha)).

listarFuncionario:- listing(funcionario).

removerFuncionario:-write("Digite o nome do funcionario: "), read(N),retract(funcionario(X,_,_)).

registrarVenda:- nl,
    write("Nome do produto: "), read(Nome),nl,
    write("Descricao: "), read(Desc),nl,
    write("Quantidade vendida: "), read(Qvendida), nl,
    produto(Nome,Desc,X), Novaquant is X- Qvendida,nl,
    retract(produto(Nome,Desc,_)),assertz(produto(Nome,Desc,Novaquant)),
    write("Atualizado "),write(Novaquant).

menu:-
    nl,
    write("[1] Adicionar Produto"),nl,
    write("[2] Remover Produto"),nl,
    write("[3] Listar Produto"),nl,
    write("[4] Cadastrar funcionario"),nl,
    write("[5] Listar funcionario"),nl,
    write("[6] Remover funcionario"),nl,
    read(Opc),
              if_else((Opc=1),adicionarProduto,
              (if_else((Opc=2),(removerProduto),
              (if_else((Opc=3),(listaProdutos),
              (if_else((Opc=4),(cadastrarFuncionario),
              (if_else((Opc=5),(listarFuncionario),
              (if_else((Opc=6),(removerFuncionario),
              (write("Opcao invalida"),menu)))))))))))).

menuUser:- nl,
            write("[1] Registrar venda"),nl,
            write("[2] Consultar produto"),nl,
            write("[3] Listar produto"),nl,
            read(Opc), if_else((Opc=1),(registrarVenda),(write("Opcao 2 ou 3"))).

login:-
    write("Digite o user: (ADMIN) "), read(User),
    write("Digite senha: (ADMIN) "), read(Senha),
    if_else(((User=isco),(Senha=1234)),menu,(nl,write("==============================="),nl,
                                             write("Dados errados, tente novamente"),nl,
                                             write("================================"),nl,nl,login)).

loginUser:-
    write("Digite o user: (FUNC) "), read(User),
    write("Digite a senha: (FUNC) "), read(Senha),if_else(funcionario(_,User,Senha),(menuUser),(nl,write("==================================="),nl,write("Dados errados, tente novamente"),nl,write("==================================="),nl,nl,loginUser)).





























