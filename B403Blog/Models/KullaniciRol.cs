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
    
    public partial class KullaniciRol
    {
        public int KullaniciRolId { get; set; }
        public int RolID { get; set; }
        public int KullaniciID { get; set; }
    
        public virtual Kullanici Kullanici { get; set; }
        public virtual Rol Rol { get; set; }
    }
}
