using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Teste_Safra
{
    class Program
    {
        static void Main(string[] args)
        {
            Menu();
            ConsoleKeyInfo opcao = Console.ReadKey();
            Console.Clear();
            Credito dados = DadosCredito();
            bool validacaoValorMaximo, validacaoQtdeParcelas, validacaoVencimento, validacaoPJ;
            string valorJuros, valorTotalJuros;
            valorTotalJuros = valorJuros = string.Empty;

            switch (opcao.KeyChar)
            {
                case '1':
                    dados.PorcentagemJurosCredito = 3;
                    validacaoValorMaximo = new CreditoDireto().ValidarCredito(dados);
                    validacaoQtdeParcelas = new CreditoDireto().ValidarParcelas(dados);
                    validacaoVencimento = new CreditoDireto().ValidarVencimentoParcela(dados);                    
                    if (validacaoValorMaximo && validacaoQtdeParcelas && validacaoVencimento)
                        Console.WriteLine("Recusado");
                    else
                        Console.WriteLine("Aprovado");
                    valorJuros = new CreditoDireto().ValorJuros(dados).ToString();
                    valorTotalJuros = new CreditoDireto().ValorTotalJuros(dados).ToString();
                    Console.WriteLine($"Valor total com juros: R$ {valorTotalJuros}");
                    Console.WriteLine($"Valor do juros: R$ {valorJuros}");
                    break;
                case '2':
                    dados.PorcentagemJurosCredito = 1;
                    validacaoValorMaximo = new CreditoConsignado().ValidarCredito(dados);
                    validacaoQtdeParcelas = new CreditoConsignado().ValidarParcelas(dados);
                    validacaoVencimento = new CreditoConsignado().ValidarVencimentoParcela(dados);
                    if (validacaoValorMaximo && validacaoQtdeParcelas && validacaoVencimento)
                        Console.WriteLine("Recusado");
                    else
                        Console.WriteLine("Aprovado");
                    valorJuros = new CreditoConsignado().ValorJuros(dados).ToString();
                    valorTotalJuros = new CreditoConsignado().ValorTotalJuros(dados).ToString();
                    Console.WriteLine($"Valor total com juros: R$ {valorTotalJuros}");
                    Console.WriteLine($"Valor do juros: R$ {valorJuros}");
                    break;
                case '3':
                    dados.PorcentagemJurosCredito = 5;
                    validacaoValorMaximo = new CreditoPessoaJuridica().ValidarCredito(dados);
                    validacaoQtdeParcelas = new CreditoPessoaJuridica().ValidarParcelas(dados);
                    validacaoVencimento = new CreditoPessoaJuridica().ValidarVencimentoParcela(dados);
                    validacaoPJ = new CreditoPessoaJuridica().ValidarCreditoMinimoPJ(dados);
                    if (validacaoValorMaximo && validacaoQtdeParcelas && validacaoVencimento && validacaoPJ)
                        Console.WriteLine("Recusado");
                    else
                        Console.WriteLine("Aprovado");
                    valorJuros = new CreditoPessoaJuridica().ValorJuros(dados).ToString();
                    valorTotalJuros = new CreditoPessoaJuridica().ValorTotalJuros(dados).ToString();
                    Console.WriteLine($"Valor total com juros: R$ {valorTotalJuros}");
                    Console.WriteLine($"Valor do juros: R$ {valorJuros}");
                    break;
                case '4':
                    dados.PorcentagemJurosCredito = 3;
                    validacaoValorMaximo = new CreditoPessoaFisica().ValidarCredito(dados);
                    validacaoQtdeParcelas = new CreditoPessoaFisica().ValidarParcelas(dados);
                    validacaoVencimento = new CreditoPessoaFisica().ValidarVencimentoParcela(dados);
                    if (validacaoValorMaximo && validacaoQtdeParcelas && validacaoVencimento)
                        Console.WriteLine("Recusado");
                    else
                        Console.WriteLine("Aprovado");
                    valorJuros = new CreditoPessoaFisica().ValorJuros(dados).ToString();
                    valorTotalJuros = new CreditoPessoaFisica().ValorTotalJuros(dados).ToString();
                    Console.WriteLine($"Valor total com juros: R$ {valorTotalJuros}");
                    Console.WriteLine($"Valor do juros: R$ {valorJuros}");
                    break;
                case '5':
                    dados.PorcentagemJurosCredito = 9;
                    validacaoValorMaximo = new CreditoImobiliario().ValidarCredito(dados);
                    validacaoQtdeParcelas = new CreditoImobiliario().ValidarParcelas(dados);
                    validacaoVencimento = new CreditoImobiliario().ValidarVencimentoParcela(dados);
                    if (validacaoValorMaximo && validacaoQtdeParcelas && validacaoVencimento)
                        Console.WriteLine("Recusado");
                    else
                        Console.WriteLine("Aprovado");
                    valorJuros = new CreditoImobiliario().ValorJuros(dados).ToString();
                    valorTotalJuros = new CreditoImobiliario().ValorTotalJuros(dados).ToString();
                    Console.WriteLine($"Valor total com juros: R$ {valorTotalJuros}");
                    Console.WriteLine($"Valor do juros: R$ {valorJuros}");
                    break;
                default:
                    break;
            }

        }

        private static void Menu()
        {
            Console.WriteLine("1 - Credito Direto");
            Console.WriteLine("2 - Credito Consignado");
            Console.WriteLine("3 - Credito Pessoa Jurídica");
            Console.WriteLine("4 - Pessoa Física");
            Console.WriteLine("5 - Imobiliário");
            Console.WriteLine();
            Console.WriteLine("Escolha uma opção: ");
        }


        private static Credito DadosCredito()
        {
            Console.WriteLine("Informe o valor do crédito: ");
            decimal valorCredito = Convert.ToDecimal(Console.ReadLine());
            Console.WriteLine("Informe a quantidade de parcelas: ");
            int qtdeParcelas = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Informe a data do primeiro vencimento: ");
            string dataVencimento = Console.ReadLine();

            Credito credito = new Credito()
            {
                ValorCredito = valorCredito,
                QuantidadeParcelas = qtdeParcelas,
                DataPrimeiroVencimento = dataVencimento
            };

            return credito;
        }
    }
}
