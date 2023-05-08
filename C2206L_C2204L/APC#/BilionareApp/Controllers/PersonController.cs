using BilionareApp.Models;
using System;
using System.Collections.Generic;
using System.IO.Enumeration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BilionareApp.Controllers
{
    public class PersonController
    {
        private string fileName = "output.txt";
        private List<Person> persons = new List<Person>();
        public void InputPersons() {
            int numberOfPersons = int.Parse(Console.ReadLine());
        }
        public void SortPersons() { 

        }
        private void DisplayPersons()
        {

        }
        public void AnalyzePersons()
        {

        }
        public void FindPersons() { }
        public void SaveToFile() { }
        public void ReadFromFile() { }
    }
}
