using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace de07
{
    internal class CatManagement : IAction<Cat>
    {
        private List<Cat> catList = new List<Cat>();
        public Cat this[int index] { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

        public void AddToList(Cat item)
        {
            catList.Add(item);
        }

        public void Display()
        {
            foreach(Cat item in catList)
            {
                item.DisplayData();
            }
        }
    }

}
