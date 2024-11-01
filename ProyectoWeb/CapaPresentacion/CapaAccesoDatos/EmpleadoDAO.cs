using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using CapaEntidades;

namespace CapaAccesoDatos
{
    public class EmpleadoDAO
    {
        #region "PATRON SINGLETON"
        private static EmpleadoDAO daoEmpleado = null;
        private EmpleadoDAO() { }
        public static EmpleadoDAO getInstance()
        {
            if (daoEmpleado == null)
            {
                daoEmpleado = new EmpleadoDAO();
            }
            return daoEmpleado;
        }
        #endregion

        public Empleado AccesoSistema(string user, string pass)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            Empleado objEmpleado = null;
            SqlDataReader dr = null;

            try
            {
                conexion = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spAccesoSistema", conexion)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@prmUser", user);
                cmd.Parameters.AddWithValue("@prmPass", pass);
                conexion.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    objEmpleado = new Empleado
                    {
                        ID = Convert.ToInt32(dr["idEmpleado"].ToString()),
                        Usuario = dr["usuario"].ToString(),
                        Clave = dr["clave"].ToString(),
                        Nombre = dr["nombres"].ToString(),
                        ApPaterno = dr["apPaterno"].ToString(),
                        ApMaterno = dr["apMaterno"].ToString(),
                        NroDocumento = dr["nroDocumento"].ToString(),
                        Estado = true
                    };
                }
            }
            catch (Exception ex)
            {
                objEmpleado = null;
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return objEmpleado;
        }

        public Empleado BuscarEmpleado(string nroDocumento)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            Empleado objEmpleado = new Empleado();

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spBuscarEmpleado", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@prmNroDocumento", nroDocumento);
                con.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    objEmpleado.ID = Convert.ToInt32(dr["idEmpleado"].ToString());
                    objEmpleado.Nombre = dr["nombres"].ToString();
                    objEmpleado.ApPaterno = dr["apPaterno"].ToString();
                    objEmpleado.ApMaterno = dr["apMaterno"].ToString();
                    objEmpleado.NroDocumento = dr["nroDocumento"].ToString();
                    objEmpleado.RTipoEmpleado.Descripcion = dr["usuario"].ToString();
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                con.Close();
            }
            return objEmpleado;
        }
    }
}