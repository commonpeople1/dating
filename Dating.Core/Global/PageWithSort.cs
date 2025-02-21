using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Dating.Core.Global
{
    public class PageWithSort
    {
        public int PageIndex { get; set; } = 1;
        public int PageSize { get; set; } = 10;
        public string? Sort { get; set; }
        public OrderType OrderType { get; set; } = OrderType.Asc;
    }
    public enum OrderType
    {
        Asc,
        Desc
    }
}