let _listaDeUsuarios = []

if(localStorage.usuarios){
    _listaDeUsuarios = JSON.parse(localStorage.getItem('usuarios'))
}

localStorage.usuarios = JSON.stringify(_listaDeUsuarios)

function cadastrar() {
    const nome = String(document.getElementById('nome').value)
    const senha = String(document.getElementById('senha').value)

    for(const index in _listaDeUsuarios){
        const usuario = _listaDeUsuarios[index].nome
        if(nome == usuario){
            return console.log("Usuário já existe")
        }
    }

    const obj = {
        'nome': nome,
        'senha': senha
    }

    _listaDeUsuarios.push(obj)
    localStorage.setItem('usuarios', JSON.stringify(_listaDeUsuarios))
    console.log(_listaDeUsuarios)
}

function login(){
    const nome = String(document.getElementById('nome').value)
    const senha = String(document.getElementById('senha').value)

    let usuario = _listaDeUsuarios.find(x => x.nome === nome && x.senha === senha)

    console.log(usuario)

    if(usuario){
        alert("Usuário autenticado!")
        return
    } else{
        alert("Usuário ou senha inválidos")
    }
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

// function login(){
//     const nome = String(document.getElementById('nome').value)
//     const senha = String(document.getElementById('senha').value)

//     for(const index in _listaDeUsuarios){
//         const usuario = _listaDeUsuarios[index].nome
//         const senha_usuario = _listaDeUsuarios[index].senha

//         if(usuario == nome && senha_usuario == senha){
//             alert("Usuário autenticado!")
//             return
//         }
//     }
//     alert("Usuário ou senha inválidos!")
    
// }
