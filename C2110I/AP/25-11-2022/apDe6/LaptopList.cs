using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace apDe6
{
    public class LaptopList
    {
        private List<Laptop> llist= new List<Laptop>();
        private int capacity;
        public LaptopList(int capacity) { 
            this.capacity = capacity;
            //indexer.Eg: objectA[2] 
        }
        public Laptop this[int i]
        {
            get  {
                if (i < 0 || i >= capacity) {
                    throw new IndexOutOfRangeException("overrange of capacity");
                }

                return llist[i];
            }
            set {
                if (i < 0 || i >= capacity)
                {
                    throw new IndexOutOfRangeException("overrange of capacity");
                }
                llist[i] = value; 
            }
        }
        int Count {
            get => llist.Count;
        }
        public void AddLaptop(Laptop laptop) {
            if (llist.Count >= this.capacity) {
                throw new Exception("No capacity for the new laptop");
            }
            llist.Add(laptop);
        }
        public void ShowFilterLaptop(float maxPrice) {
            llist.FindAll(laptop => laptop.PriceCal <= maxPrice)
                .ForEach(laptop => {
                    Console.WriteLine(laptop.ToString());
                });
        }
    }
}
