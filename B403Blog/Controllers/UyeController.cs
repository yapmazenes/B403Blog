using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace B403Blog.Controllers
{
    using Models;

    public class UyeController : Controller
    {
        //
        // GET: /Uye/
        B403BlogEntities db = new B403BlogEntities();
        public ActionResult Index()
        {
            return View();
        }
        public void TakipEt(string kadi, int yid)
        {

            Kullanici kullanici = db.Kullanicis.FirstOrDefault(x => x.KullaniciAdi == kadi);
            Kullanici yazar = db.Kullanicis.FirstOrDefault(x => x.KullaniciId == yid);
            if (kullanici.KullaniciId != yazar.KullaniciId)
            {
                yazar.Kullanici1.Add(kullanici);
                db.SaveChanges();
            }

        }
        public bool Takipcik(string kadi, int yid)
        {

            Kullanici kullanici = db.Kullanicis.FirstOrDefault(x => x.KullaniciAdi == kadi);
            Kullanici yazar = db.Kullanicis.FirstOrDefault(x => x.KullaniciId == yid);
            yazar.Kullanici1.Remove(kullanici);
            db.SaveChanges();
            return true;

        }

    }
}
