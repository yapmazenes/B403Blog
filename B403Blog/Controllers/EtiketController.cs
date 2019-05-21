using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace B403Blog.Controllers
{
    using Models;
    public class EtiketController : Controller
    {
        //
        // GET: /Etiket/
        B403BlogEntities db = new B403BlogEntities();
        public ActionResult Index(int id)
        {
            return View(id);
        }
        public PartialViewResult EtiketsWidget()
        {
            return PartialView(db.Etikets.ToList());
        }
        public ActionResult MakaleListele(int id)
        {
            var data = db.Makales.Where(x => x.Etikets.Any(y => y.EtiketId == id)).ToList();
            return View("MakaleListeleWidget", data);
        }
    }
}
