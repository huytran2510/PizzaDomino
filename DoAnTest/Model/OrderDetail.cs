using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnTest.Model
{
    public class OrderDetail
    {
        public int ID { get; set; }
        public string IdProduct { get; set; }
        public int IdOrder { get; set; }
        public int SoLuong { get; set; }
    }
}