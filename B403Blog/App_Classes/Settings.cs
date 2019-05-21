using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Linq;
using System.Web;

namespace B403Blog.App_Classes
{
    public class Settings
    {
        public static Size ResimKucukBoyut
        {
            get
            {
                Size sonuc = new Size();
                sonuc.Width = Convert.ToInt16(ConfigurationManager.AppSettings["SmallWidth"]);
                sonuc.Height = Convert.ToInt16(ConfigurationManager.AppSettings["SmallHeight"]);
                return sonuc;
            }
        }

        public static Size ResimOrtaBoyut
        {
            get
            {
                Size sonuc = new Size();
                sonuc.Width = Convert.ToInt16(ConfigurationManager.AppSettings["MediumWidth"]);
                sonuc.Height = Convert.ToInt16(ConfigurationManager.AppSettings["MediumHeight"]);
                return sonuc;
            }
        }

        public static Size ResimBuyukBoyut
        {
            get
            {
                Size sonuc = new Size();
                sonuc.Width = Convert.ToInt16(ConfigurationManager.AppSettings["LargeWidth"]);
                sonuc.Height = Convert.ToInt16(ConfigurationManager.AppSettings["LargeHeight"]);
                return sonuc;
            }
        }
        public static Size YazarBoyut
        {
            get
            {
                Size sonuc = new Size();
                sonuc.Width = Convert.ToInt16(ConfigurationManager.AppSettings["YazarWidth"]);
                sonuc.Height = Convert.ToInt16(ConfigurationManager.AppSettings["YazarHeight"]);
                return sonuc;
            }
        }



    }
}