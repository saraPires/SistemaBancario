import Foundation


struct ContaBancaria {
    let numero: String
    let titular: String
    let senha: String
    var saldo: Double
    
}

//Dados de conta Adm
let userAdmin = "adm01"
let passUser = "01234"

var contasBancarias: [ContaBancaria] = []
var executarSessao: Bool = true

print("Bem vindo ao sistema bancario - Projeto Curso Swift")

while executarSessao {
    print ("\n ========Menu de opções========")
    print("1 - Criar conta")
    print("2 - Area do Administrdor - listar as contas")
    print("0 - Criar conta")
    print("Escolha Uma das Opções: ", terminator: "")
    
    if let opcao = readLine() {
        switch opcao {
        case "1":
            print("\n Nova Conta ")
            print("Número:" )
            
        case "0":
            executarSessao = false
            print("Até logo!")

        default:
            print("Opção Invalida")
        }
    }
}
