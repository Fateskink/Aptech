using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarApp
{
    public class LuxuryCar:Car
    {
        private float specialRate = 0.8f;
        public override float CalculatePrice() => base.CalculatePrice() + Price * specialRate;
        public float CalculatePrice(float transportCost) =>
            this.CalculatePrice() + transportCost;


    }
}
