using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Teste_Safra.Interfaces;

namespace Teste_Safra
{
    public class Credito: CreditoService
    {
        public int TipoCredito { get; set; }
        public decimal ValorCredito { get; set; }
        public int PorcentagemJurosCredito { get; set; }
        public int QuantidadeParcelas { get; set; }
        public string DataPrimeiroVencimento { get; set; }
        public string StatusCredito { get; set; }
        public decimal ValorTotalCredito { get; set; }
        public decimal ValorJuros { get; set; }
    }
}
