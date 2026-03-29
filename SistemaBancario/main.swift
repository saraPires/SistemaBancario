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
    print("2 - Login Usuário (Acessar Minha Conta)")
    print("3 - Area do Administrdor - listar as contas")
    print("0 - Sair")
    print("Escolha Uma das Opções: ", terminator: "")
    
    if let opcao = readLine() {
        switch opcao {
        case "1":
            print("\n ======== Criar Conta ==========")
            print("Número:", terminator: "" )
            let num = readLine() ?? ""
            print("Titular:", terminator: "")
            let titular = readLine() ?? ""
            print("Senha:", terminator: "")
            let pass = readLine() ?? ""
            print("Saldo Inicial: R$ ",terminator: "")
            let saldoIni = Double(readLine() ?? "0") ?? 0.0
            
            
            let conta = ContaBancaria(numero: num, titular: titular, senha: pass, saldo: saldoIni)
            contasBancarias.append(conta)
            print(" Conta de ", titular, "Criada!!")
            
        case "2":
            print("\n ====== Login Cliente ===========")
            print("Número da Conta: ", terminator: "")
            let numContaBusca = readLine() ?? ""
            print("Senha: ", terminator: "")
            let senhaBusca = readLine() ?? ""
            
            if let i = contasBancarias.firstIndex(where: {$0.numero == numContaBusca && $0.senha == senhaBusca } ) {
                var logado = true
                
            }
            
            
            
            
        case "0":
            executarSessao = false
            print("Até logo!")

        default:
            print("Opção Invalida")
        }
    }
}
