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
    
    public partial class Kategori
    {
        public Kategori()
        {
            this.Makales = new HashSet<Makale>();
        }
    
        public int KategoriId { get; set; }
        public string Adi { get; set; }
        public string Aciklama { get; set; }
    
        public virtual ICollection<Makale> Makales { get; set; }
    }
}