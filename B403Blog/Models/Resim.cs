//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace B403Blog.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Resim
    {
        public Resim()
        {
            this.Kullanicis = new HashSet<Kullanici>();
            this.Makales = new HashSet<Makale>();
        }
    
        public int ResimId { get; set; }
        public string KucukBoyut { get; set; }
        public string OrtaBoyut { get; set; }
        public string BuyukBoyut { get; set; }
        public string Video { get; set; }
        public Nullable<int> MakaleID { get; set; }
        public Nullable<int> KullaniciID { get; set; }
    
        public virtual ICollection<Kullanici> Kullanicis { get; set; }
        public virtual Kullanici Kullanici { get; set; }
        public virtual ICollection<Makale> Makales { get; set; }
        public virtual Makale Makale { get; set; }
    }
}
