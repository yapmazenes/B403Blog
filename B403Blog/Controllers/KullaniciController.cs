using B403Blog.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
namespace B403Blog.Controllers
{
    public class KullaniciController : Controller
    {
        //
        // GET: /Kullanici/
        B403BlogEntities db = new B403BlogEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GirisYap()
        {
            return View();
        }
        [AllowAnonymous]
        [HttpPost]
        public ActionResult GirisYap(Kullanici k)
        {
            string ka = ValidateUser(k.KullaniciAdi, k.Parola);


            if (!string.IsNullOrEmpty(ka))
            {
                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, k.KullaniciAdi, DateTime.Now, DateTime.Now.AddMinutes(15), true, ka, FormsAuthentication.FormsCookiePath);
                HttpCookie ck = new HttpCookie(FormsAuthentication.FormsCookieName);
                if (ticket.IsPersistent)
                {
                    ck.Expires = ticket.Expiration;

                }

                Response.Cookies.Add(ck);
                FormsAuthentication.RedirectFromLoginPage(k.KullaniciAdi, true);
                string url = FormsAuthentication.GetRedirectUrl(k.KullaniciAdi, true);
               
                return Redirect(url);


            }
            return RedirectToAction("GirisYap");


        }

        string ValidateUser(string ka, string pwd)
        {
            Kullanici kl = db.Kullanicis.FirstOrDefault(x => x.KullaniciAdi == ka && x.Parola == pwd);



            if (kl != null)
                return kl.KullaniciAdi;
            else
            {
                return "";

            }


        }

        [Authorize]
        public ActionResult CikisYap(string rawURL)
        {
            FormsAuthentication.SignOut();
            return Redirect(rawURL);
        }


        [AllowAnonymous]
        public ActionResult UyeOl()
        {
            return View();
        }
        [AllowAnonymous]
        [HttpPost]
        public ActionResult UyeOl(Kullanici k, string radio)
        {
            if (radio == "1")
                k.Cinsiyet = true;
            else
                k.Cinsiyet = false;
            k.Yazar = false;
            k.Onaylandi = false;
            k.Aktif = true;
            k.KayitTarihi = DateTime.Now;
            db.Kullanicis.Add(k);
            db.SaveChanges();
            return RedirectToAction("GirisYap");
        }
    }
}
