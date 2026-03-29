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

func obterSaudacao() -> String {
    let hora = Calendar.current.component(.hour, from: Date())
    if hora >= 5 && hora < 12 {
        return "Bom dia"
    } else if hora >= 12 && hora < 18 {
        return "Boa tarde"
    } else {
        return "Boa noite"
    }
}

print("Bem vindo ao sistema bancario - Projeto Curso Swift")

while executarSessao {
    print ("\n ======== Menu de opções ========")
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
                let saudacao = obterSaudacao()
                while logado {
                    print("\n ==== ", saudacao, contasBancarias[i].titular,", bem vindo a sua conta bancaria " )
                    print("1 - Verificar Saldo")
                    print("2 - Efetuar Depósito")
                    print("3 - Fazer Transferência")
                    print("0 - Sair da Conta")
                    print("Escolha: ", terminator: "")
                    
                    if let opcaoCliente = readLine() {
                        switch opcaoCliente {
                        case "1":
                            print("\n Seu saldo atual é de: R$ ", contasBancarias[i].saldo)
                        case "2":
                            print("\n Valor do depósito: R$ ", terminator: "")
                            let valorDeposito = Double(readLine() ?? "0") ?? 0.0
                            if  valorDeposito > 0 {
                                contasBancarias[i].saldo += valorDeposito
                                print("Depósito efetuado com sucesso! Seu novo saldo é: R$ ", contasBancarias[i].saldo )
                            }
                        case "3":
                            print("\n Transferência entre contas ")
                            print("Digite a conta para transferência: ", terminator: "")
                            let contaDestino = readLine() ?? ""
                        case "0":
                            logado = false
                        default:
                            print("Opção Invalida!!")
                        }
                    }
                }
            }
            
            
            
            
        case "0":
            executarSessao = false
            print("Até logo!")

        default:
            print("Opção Invalida")
        }
    }
    

    
}
