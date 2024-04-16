using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnTest.Model
{
    public class Product
    {
        public int ID { get; set; }
        public string TenSP { get; set; }
        public int MaloaiSP { get; set; }
        public string Size { get; set; }
        public decimal Price { get; set; }
        public int BestSeller { get; set; }
        public string Image { get; set; }

        public Product(int iD, string tenSP, string size, decimal price, string image)
        {
            ID = iD;
            TenSP = tenSP;
            Size = size;
            Price = price;
            Image = image;
        }
    }
}