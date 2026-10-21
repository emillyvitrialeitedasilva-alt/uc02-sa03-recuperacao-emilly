// Autor: seu nome Completo
programa {
// Constantes do sistema
	const real PRECO_HORA = 10.0
	const real VALOR_DESCONTO = 5.0
	const inteiro TOTAL_ALUGUEIS = 5

  funcao inicio() {
    // Vetor para guardar as horas dos 5 aluguéis
		inteiro horas[TOTAL_ALUGUEIS]
		
		// Variáveis de controle do resumo
		real totalArrecadado = 0.0
		inteiro qtdCurto = 0
		inteiro qtdMedio = 0
		inteiro qtdLongo = 0
		inteiro maiorHoras = 0
		
		escreva("=== SISTEMA SENAI PEDALA ORLA ===\n")
		
		// 1. Leitura das horas usando laço 'para'
		para (inteiro i = 0; i < TOTAL_ALUGUEIS; i++)
		{
			escreva("Digite as horas do aluguel ", (i + 1), ": ")
			leia(horas[i])
		}
		
		escreva("\n--- EXTRATO DOS ALUGUÉIS DO DIA ---\n")
		
		// 2. Processamento e exibição usando laço 'para'
		para (inteiro i = 0; i < TOTAL_ALUGUEIS; i++)
		{
			inteiro h = horas[i]
			real valor = calcularValor(h)
			cadeia tipo = classificarTipo(h)
			
			// Chamada do procedimento para mostrar a linha do aluguel
			mostrarLinhaAluguel(i + 1, h, valor, tipo)
			
			// Acumuladores e estatísticas para o resumo
			totalArrecadado = totalArrecadado + valor
			
			// Contadores por tipo
			se (tipo == "CURTO")
			{
				qtdCurto++
			}
senao se (tipo == "MÉDIO")
			{
				qtdMedio++
			}
			senao se (tipo == "LONGO")
			{
				qtdLongo++
			}
			
			// Busca do aluguel mais longo (maior quantidade de horas)
			se (h > maiorHoras)
			{
				maiorHoras = h
			}
		}
		
		// 3. Exibição do resumo do dia
		escreva("\n====================================\n")
		escreva("RESUMO DO DIA:\n")
		escreva("Total arrecadado: R$ ", totalArrecadado, "\n")
		escreva("Quantidade de aluguéis CURTO: ", qtdCurto, "\n")
		escreva("Quantidade de aluguéis MÉDIO: ", qtdMedio, "\n")
		escreva("Quantidade de aluguéis LONGO: ", qtdLongo, "\n")
		escreva("Horas do aluguel mais longo: ", maiorHoras, " hora(s)\n")
		escreva("====================================\n")
	}

	// Função que recebe as horas e retorna o valor a pagar
	funcao real calcularValor(inteiro h)
	{
		real valorTotal = h * PRECO_HORA
		
		// Regra: Aluguel de 3 horas ou mais ganha R$ 5,00 de desconto
		se (h >= 3)
		{
			valorTotal = valorTotal - VALOR_DESCONTO
		}
		
		retorne valorTotal
	}

	// Função que recebe as horas e retorna o tipo do aluguel
	funcao cadeia classificarTipo(inteiro h)
	{
		se (h == 1)
		{
			retorne "CURTO"
		}
		senao se (h == 2 ou h == 3)
		{
			retorne "MÉDIO"
		}
		senao
		{
			retorne "LONGO"
		}
	}

	// Procedimento que mostra a linha de um aluguel formatada
	funcao mostrarLinhaAluguel(inteiro numero, inteiro h, real valor, cadeia tipo)
	{
		escreva("Aluguel ", numero, " | Horas: ", h, "h | Valor: R$ ", valor, " | Tipo: ", tipo, "\n")
	}
    
  }

