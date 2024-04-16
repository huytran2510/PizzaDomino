using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnTest.DTO
{
    public class OrderDTO
    {
        public string ID { get; set; }
        public DateTime Date { get; set; }
        public decimal TotalPrice { get; set; }
        public List<OrderDetailsDTO> OrderDetails { get; set; }

    }
}