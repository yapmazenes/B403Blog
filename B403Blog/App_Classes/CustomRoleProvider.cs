﻿using B403Blog.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace B403Blog.App_Classes
{
    public class CustomRoleProvider : RoleProvider
    {
        B403BlogEntities db = new B403BlogEntities();
        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override string ApplicationName
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }

        public override string[] GetRolesForUser(string username)
        
        {
            if (!string.IsNullOrEmpty(username))
            {
                Kullanici kl = db.Kullanicis.FirstOrDefault(x => x.KullaniciAdi == username);
                if (kl != null)
                {
                    return kl.KullaniciRols == null ? new string[] { } : kl.KullaniciRols.Select(x => x.Rol).Select(x => x.RolAdi).ToArray();
                }
                return new string[] { };
            }

            else
            {
                return new string[] { };
            }
        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            throw new NotImplementedException();
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }

    }
}