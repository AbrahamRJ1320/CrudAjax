﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DL
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class CrudAjaxEntities : DbContext
    {
        public CrudAjaxEntities()
            : base("name=CrudAjaxEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Empleado> Empleadoes { get; set; }
        public virtual DbSet<Estado> Estadoes { get; set; }
    
        public virtual ObjectResult<EmpleadoGetAll_Result> EmpleadoGetAll()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EmpleadoGetAll_Result>("EmpleadoGetAll");
        }
    }
}