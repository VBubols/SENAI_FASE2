//É um modelo que define um objeto e as caracteristicas dele
//Boa prática: Primeira letra da classe ser maiuscula

class Pessoa {
    constructor(nome, idade){
        this.nome = nome;
        this.idade = idade;
    }

    falar(){
        console.log(`Olá meu nome é ${this.nome}`);
    }
}

//Testando classe
const pessoa1 = new Pessoa('Vitor', 23) //a variável pessoa1 recebe um nova instância da classe Pessoa
pessoa1.falar() //chamada do metódo da classe Pessoa

const pessoa2 = new Pessoa('Ester', 24)
pessoa2.falar()