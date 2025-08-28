let _listaDeUsuarios = []

if(localStorage.usuarios){
    _listaDeUsuarios = JSON.parse(localStorage.getItem('usuarios'))
}

localStorage.usuarios = JSON.stringify(_listaDeUsuarios)

function enviar() {
    const nome = String(document.getElementById('nome').value)
    const senha = String(document.getElementById('senha').value)

    const obj = {
        'nome': nome,
        'senha': senha
    }

    for(const index in _listaDeUsuarios){
        const usuario = _listaDeUsuarios[index].nome
        if(nome == usuario){
            return console.log("Usuário já existe")
        }
    }

    _listaDeUsuarios.push(obj)
    localStorage.setItem('usuarios', JSON.stringify(_listaDeUsuarios))
    console.log(_listaDeUsuarios)
}

function deletarUsuario(){
    const nome = prompt("Digite o nome do usuário a ser deletado:")

    for(const index in _listaDeUsuarios){
        const usuario = _listaDeUsuarios[index].nome 
        if(nome == usuario){
            _listaDeUsuarios.splice(index, 1)
            console.log("Lista depois de ser deletada:")
            console.log(_listaDeUsuarios)
        } else{
            console.log("Não foi possível achar o usuário.")
            return
        }
    }
}
