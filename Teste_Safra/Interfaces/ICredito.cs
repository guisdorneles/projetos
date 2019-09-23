using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Teste_Safra.Interfaces
{
    public interface ICredito
    {
        bool ValidarCredito(Credito credito);
        bool ValidarParcelas(Credito credito);
        bool ValidarVencimentoParcela(Credito credito);
        bool ValidarCreditoMinimoPJ(Credito credito);
        decimal ValorTotalJuros(Credito credito);
        decimal ValorJuros(Credito credito);
    }
}
