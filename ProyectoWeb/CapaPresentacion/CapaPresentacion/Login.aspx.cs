using System;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;
using CapaLogicaNegocio;

namespace CapaPresentacion
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Session["UserSessionId"] = null;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            try
            {
                Empleado objEmpleado = EmpleadoLN.getInstance().AccesoSistema(email, password);
                if (objEmpleado != null)
                {
                    Session["UserSessionEmpleado"] = objEmpleado;
                    FormsAuthentication.RedirectFromLoginPage(email, false);
                }
                else
                {
                    lblMessage.Text = "Invalid email or password.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error connecting to the database: " + ex.Message;
            }
        }
    }
}