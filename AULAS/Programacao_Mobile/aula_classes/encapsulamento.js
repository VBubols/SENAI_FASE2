//Encapsulamento é a técnica de "esconder" detalhes internos de uma classe e controlar acesso a ela

class ContaBancaria {
    #saldo = 0; //atributo privado

    depositar(valor){
        this.#saldo += valor;
    }

    verSaldo(){
        return this.#saldo;
    }
}

const conta = new ContaBancaria();
conta.depositar(100);
console.log(conta.verSaldo());