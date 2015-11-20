using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Gerir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            dat();
            FormView1.ChangeMode(FormViewMode.Edit);

        }
        protected void UpdateCancelButton_Click(object sender, EventArgs e)
        {

        }
        private void dat()
        {
            pnver.Visible = false;
            FormView1.Visible = true;


        }
        protected void InsertCancelButton_Command(object sender, CommandEventArgs e)
        {


        }
        protected void btnnovo_Click(object sender, EventArgs e)
        {
            dat();
            FormView1.ChangeMode(FormViewMode.Insert);
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex >= 0)
            {


                btneditar.Visible = true;
                btneliminar.Visible = true;
            }
            else
            {

                btneditar.Visible = false;
                btneliminar.Visible = false;
            }
        }
        protected void FormView1_ModeChanged(object sender, EventArgs e)
        {
            pnver.Visible = (FormView1.CurrentMode == FormViewMode.ReadOnly);
            FormView1.Visible = !(FormView1.CurrentMode == FormViewMode.ReadOnly);
        }
        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {


            GridView1.DataBind();

            btneditar.Visible = false;
            btneliminar.Visible = false;
        }
        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {


            GridView1.DataBind();

            btneditar.Visible = false;
            btneliminar.Visible = false;
        }
        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            GridView1.DataBind();

            btneditar.Visible = false;
            btneliminar.Visible = false;
        }
        protected void btneliminar_Click(object sender, EventArgs e)
        {
            FormView2.DataBind();
            pnver.Visible = false;
            painelEliminar.Visible = true;
        }
        protected void btCancelaEliminar_Click(object sender, EventArgs e)
        {
            painelEliminar.Visible = false;
            pnver.Visible = true;
        }
        protected void btConfirmaEliminar_Click(object sender, EventArgs e)
        {
            //   FormView1.DeleteItem();


            // *** Create customer ****
            SqlConnection connection = null;
            try
            {
              connection = new SqlConnection(ConfigurationManager.ConnectionStrings["yoguflameConnectionString"].ConnectionString);
             connection.Open();
            SqlCommand elim = new SqlCommand("UPDATE Cliente SET Estado = 1 WHERE (IDCliente = @original_IDCliente)", connection);
            elim.Parameters.AddWithValue("@original_IDCliente", GridView1.SelectedValue);
            elim.ExecuteNonQuery();
            }
            finally
            {
               if (connection != null) connection.Close();
            }
            painelEliminar.Visible = false;
            GridView1.DataBind();
            pnver.Visible = true;
        }

        private FileUpload FileUpload1 = null;
        protected void FileUpload1_Load(object sender, EventArgs e)
        {
            FileUpload1 = (FileUpload)sender;
        }
        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {




        }
        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {





        }

        protected void comboloc_Load(object sender, EventArgs e)
        {

        }



        protected void Button1_Click1(object sender, EventArgs e)
        {

        }

        protected void ButtonClearSearch_Click(object sender, EventArgs e)
        {
            TextBoxDescriptionSearch.Text = "";
        }
    }
}
