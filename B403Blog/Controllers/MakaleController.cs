using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Drawing;
using B403Blog.App_Classes;
namespace B403Blog.Controllers
{
    using Models;

    [Authorize]
    public class MakaleController : Controller
    {
        //
        // GET: /Makale/

        B403BlogEntities db = new B403BlogEntities();
        [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }
        [Authorize(Roles = "Admin,Yazar")]
        public ActionResult Ekle()
        {
            ViewBag.Kategori = db.Kategoris.ToList();
            ViewBag.Etiket = db.Etikets.ToList();
            return View();
        }
        [HttpPost]
        public ActionResult Ekle(Makale mkl, HttpPostedFileBase image, string etikets)
        {
            Image img = Image.FromStream(image.InputStream);
            Bitmap kckResim = new Bitmap(img, Settings.ResimKucukBoyut);
            Bitmap ortaResim = new Bitmap(img, Settings.ResimOrtaBoyut);
            Bitmap bykResim = new Bitmap(img, Settings.ResimBuyukBoyut);
            kckResim.Save(Server.MapPath("/Content/MakaleResim/KucukBoyut/" + image.FileName));
            ortaResim.Save(Server.MapPath("/Content/MakaleResim/OrtaBoyut/" + image.FileName));
            bykResim.Save(Server.MapPath("/Content/MakaleResim/BuyukBoyut/" + image.FileName));
            Resim rsm = new Resim();
            rsm.KucukBoyut = "/Content/MakaleResim/KucukBoyut/" + image.FileName;
            rsm.OrtaBoyut = "/Content/MakaleResim/OrtaBoyut/" + image.FileName;
            rsm.BuyukBoyut = "/Content/MakaleResim/BuyukBoyut/" + image.FileName;
            db.Resims.Add(rsm);
            db.SaveChanges();
            mkl.ResimID = rsm.ResimId;
            mkl.EklenmeTarihi = DateTime.Now;
            mkl.GoruntulenmeSayisi = 0;
            mkl.Begeni = 0;
            int yzrID = db.Kullanicis.FirstOrDefault(x => x.KullaniciAdi == User.Identity.Name).KullaniciId;
            mkl.YazarID = yzrID;
            db.Makales.Add(mkl);

            List<Etiket> e = new List<Etiket>();
            List<string> parse = etikets.Split(',').ToList();
            foreach (String item in parse)
            {
                Etiket a = new Etiket();
                a.Adi = item;
                e.Add(a);

            }
            mkl.Etikets = e;
            db.SaveChanges();
            return RedirectToAction("Index", "Home");


        }
        [AllowAnonymous]
        public ActionResult Detay(int id)
        {
            Makale data = db.Makales.FirstOrDefault(x => x.MakaleId == id);
            Kullanici yazar = db.Kullanicis.FirstOrDefault(x => x.KullaniciId == data.YazarID);
            if (User.Identity.IsAuthenticated)
            {
                Kullanici takipci = db.Kullanicis.FirstOrDefault(x => x.KullaniciAdi == User.Identity.Name);
               
                    ViewBag.TakipEdiliyorMu = yazar.Kullanici1.Any(x => x.KullaniciId == takipci.KullaniciId);
                

            }
            return View(data);
        }

        public string Begen(int id)
        {
            Makale mkl = db.Makales.FirstOrDefault(x => x.MakaleId == id);
            mkl.Begeni++;
            db.SaveChanges();
            return mkl.Begeni.ToString();
        }

        public void View(int id)
        {
            Makale m = db.Makales.FirstOrDefault(x => x.MakaleId == id);
            m.GoruntulenmeSayisi++;
            db.SaveChanges();
        }
        public ActionResult YorumYaz(Yorum y)
        {
            
            db.Yorums.Add(y);
            y.EklenmeTarihi = DateTime.Now;
            db.SaveChanges();
            return RedirectToAction("Detay", "Makale", new { id=y.MakaleID});
        }
    }
}
