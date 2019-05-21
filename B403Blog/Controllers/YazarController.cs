using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace B403Blog.Controllers
{
    using Models;
    
    public class YazarController : Controller
    {
        //
        // GET: /Yazar/
        B403BlogEntities db = new B403BlogEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult YazarOl()
        {
            return View();
        }
        [HttpPost]
        public ActionResult YazarOl(Kullanici k, string radio)
        {
           
            if (radio == "1")
                k.Cinsiyet = true;
            else
                k.Cinsiyet = false;
            k.Yazar = true;
            k.Onaylandi = false;
            k.Aktif = true;
            k.KayitTarihi = DateTime.Now;
            db.Kullanicis.Add(k);
            db.SaveChanges();

            Rol yazar = db.Rols.FirstOrDefault(x=>x.RolAdi=="Yazar");
            KullaniciRol kr = new KullaniciRol();
            kr.RolID = yazar.RolId;
            kr.KullaniciID = k.KullaniciId;
            db.KullaniciRols.Add(kr);
            db.SaveChanges();
            return RedirectToAction("Index","Home");
         
        }
    }
}
