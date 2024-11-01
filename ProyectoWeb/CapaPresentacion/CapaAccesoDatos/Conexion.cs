﻿using System;
using System.Configuration;
using System.Data.SqlClient;

namespace CapaAccesoDatos
{
    public class Conexion
    {
        #region "PATRON SINGLETON"
        private static Conexion conexion = null;
        private Conexion() { }
        public static Conexion getInstance()
        {
            if (conexion == null)
            {
                conexion = new Conexion();
            }
            return conexion;
        }
        #endregion

        public SqlConnection ConexionBD()
        {
            SqlConnection conexion = new SqlConnection();
            conexion.ConnectionString = GetConnectionString();
            return conexion;
        }
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DBClinica_testConnectionString"].ConnectionString;
        }
    }
}