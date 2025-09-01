let _listaDeUsuarios = []

if(localStorage.usuarios){
    _listaDeUsuarios = JSON.parse(localStorage.getItem('usuarios'))
}

localStorage.setItem('usuarios', JSON.stringify(_listaDeUsuarios))

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

function verificarUsuario(nome, senha){
    let usuarioExiste = _listaDeUsuarios.find(x => x.nome === nome && x.senha === senha)
    return usuarioExiste
}

function login(){
    const nome = String(document.getElementById('nome').value)
    const senha = String(document.getElementById('senha').value)

    let usuarioExiste = verificarUsuario(nome, senha)

    if(usuarioExiste){
        alert("Usuário autenticado!")
        window.location.href = './home.html'
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

async function perguntar(){
    let apiKey = ''

    let url = `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=${apiKey}`

    let resposta = await fetch(url, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            "contents": [
              {
                "parts": [
                  {
                    "text": "Faça uma piada"
                  }
                ]
              }
            ]
          })
    });

    const info = await resposta.json()
    const text = info.candidates[0].content.parts[0].text;
    alert(text)
    console.log(info)
}