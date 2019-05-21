using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace B403Blog.Controllers
{
    using Models;
  
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        B403BlogEntities db = new B403BlogEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult MakaleListeleWidget()
        {
            var data = db.Makales.ToList();
            return View("MakaleListeleWidget",data);
        }
        public PartialViewResult PopulerMakalelerWidget()
        {
            return PartialView(db.Makales.OrderByDescending(x=>x.GoruntulenmeSayisi).Take(3).ToList());
        }
    }
}
