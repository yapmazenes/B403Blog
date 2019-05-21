using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace B403Blog.Controllers
{
    using Models;
    [Authorize(Roles="Admin")]
    public class AdminController : Controller
    {
        //
        // GET: /Admin/
        B403BlogEntities db = new B403BlogEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult YazarOnaylari()
        {
            var data = db.Kullanicis.Where(x=>x.Yazar==true&& x.Onaylandi==false).ToList();
            return View(data);
        }
        public string  YazarOnayla(int kid,string combo)
        {
            Kullanici k = db.Kullanicis.FirstOrDefault(x => x.KullaniciId == kid);
            if (combo=="checked")
            {
                k.Onaylandi = true;
                db.SaveChanges();
                
               return  "Onaylandı";
            }
            else
            {
               return "Onaylanamadı!";
            }
        }

    }
}
