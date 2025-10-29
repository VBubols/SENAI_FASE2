//Herança permite que a classe (filho) reaproveite e estenda comportamentos da classe (pai)

class Pessoa {
    constructor(nome, idade){
        this.nome = nome;
        this.idade = idade;
    }

    falar(){
        console.log(`Olá meu nome é ${this.nome}`);
    }
}

class Funcionario extends Pessoa{
    constructor(nome, idade, cargo){
        super(nome, idade); // recebe da classe pai (pessoa)
        this.cargo = cargo;
    }

    trabalhar(){
        console.log(`Meu nome é ${this.nome} e eu trabalho como ${this.cargo}`);
    }
}

const func1 = new Funcionario('Vitor', 23, 'Desempregado');
func1.falar()
func1.trabalhar()