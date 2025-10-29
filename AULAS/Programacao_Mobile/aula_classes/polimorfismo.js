// Polimorfismo - Permite que métodos com o mesmo nome tenham 
// comportamentos diferentes dependendo da classe que implementa
//Permite o comportamento diferente para o mesmo método

class Animal {
    falar(){
        console.log('Som genérico de animal.');
    }
}

class Cachorro extends Animal {
    falar(){
        console.log("Latido!!")
    }
}

class Gato extends Animal {
    falar(){
        console.log("Miado!!")
    }
}

const animais = [new Cachorro(), new Gato(), new Animal()]

animais.forEach(a => a.falar());//Estrutura de repetição forEach para navegar o array