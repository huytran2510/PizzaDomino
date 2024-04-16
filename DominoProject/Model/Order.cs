using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnTest.Model
{
    public class Order
    {
        public int ID { get; set; }
        public DateTime Date { get; set; }
        public decimal TotalPrice { get; set; }
        public int IdCustomer { get; set; }
    }
}