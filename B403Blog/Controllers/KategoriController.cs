using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace B403Blog.Controllers
{
    using Models;
    public class KategoriController : Controller
    {
        B403BlogEntities db = new B403BlogEntities();
        //
        // GET: /Kategori/

        public ActionResult Index(int id)
        {
            return View(id);
        }
        public PartialViewResult KategoriWidget()
        {
            return PartialView(db.Kategoris.ToList());
        }
        public ActionResult MakaleListele(int id)
        {
            var data = db.Makales.Where(x => x.KategoriID == id).ToList();
            return View("MakaleListeleWidget", data);
        }

    }
}
