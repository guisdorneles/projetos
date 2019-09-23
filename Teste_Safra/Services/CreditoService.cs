using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Teste_Safra.Interfaces;

namespace Teste_Safra
{
    public class CreditoService : ICreditoService
    {     
        public bool ValidarCredito(Credito credito)
        {
            if (Convert.ToDecimal((credito.ValorCredito * credito.PorcentagemJurosCredito)/100) + credito.ValorCredito > 1000000.00M)
                return false;

            return true;
        }

        public bool ValidarParcelas(Credito credito)
        {
            if (credito.QuantidadeParcelas < 5 && credito.QuantidadeParcelas > 72)
                return false;

            return true;
        }

        public bool ValidarVencimentoParcela(Credito credito)
        {
            DateTime dataPrimeiroVencimento = DateTime.ParseExact(credito.DataPrimeiroVencimento, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime dataMinimaVencimento = DateTime.Now.AddDays(15);
            DateTime dataMaximaVencimento = DateTime.Now.AddDays(40);

            if (dataMinimaVencimento < dataPrimeiroVencimento && dataPrimeiroVencimento > dataMaximaVencimento)
                return false;

            return true;
        }

        public bool ValidarCreditoMinimoPJ (Credito credito)
        {
            if (Convert.ToDecimal((credito.ValorCredito * credito.PorcentagemJurosCredito) / 100) + credito.ValorCredito < 15000.00M)
                return false;

            return true;
        }

        public decimal ValorTotalJuros(Credito credito)
        {
           return Convert.ToDecimal((credito.ValorCredito * credito.PorcentagemJurosCredito) / 100) + credito.ValorCredito;
        }

        public decimal ValorJuros(Credito credito)
        {
            return Convert.ToDecimal((credito.ValorCredito * credito.PorcentagemJurosCredito) / 100);
        }
    }
}
