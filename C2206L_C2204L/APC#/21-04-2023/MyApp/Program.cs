using MyApp.Models;

namespace MyApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int x = 10;
            float y = (float)10;
            Console.WriteLine($"x is : {x},, y = {y}");
            /*
            MyClass obj1 = new MyClass("Object 1");
            MyClass obj2 = new MyClass("Object 2");
            MyClass obj3 = new MyClass("Object 3");

            MyClass obj5 = obj1;
            MyClass obj6 = obj1;

            obj1 = null;
            obj5 = null;
            obj6 = null;

            obj2 = null;
            */
            //GC.Collect();

            //Console.ReadKey();
            Point p1 = new Point(10, 90);
            Point p3 = p1;//assign
            p1.X = 100;
            Point p2 = new Point(10, 90);
            Console.WriteLine($"p2.x = {p2.X}");            
            
            Console.WriteLine($"p3.x = {p3.X}");
            Console.WriteLine("haha");

            MyClass myClass11 = new MyClass("xx");
            MyClass myClass22 = myClass11;
            myClass11.Name = "yyyyy";
            Console.WriteLine($"myClass22.Name = {myClass22.Name}");

        }
    }
}