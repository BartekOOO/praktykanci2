using DevExpress.ClipboardSource.SpreadsheetML;
using DevExpress.XtraExport.Helpers;
using System;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;


public partial class Main : System.Web.UI.Page {

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            alertSpan.Visible = false;
            alertSpan.InnerText = "Aby dodać nowego praktykanta uzupełnij jego dane";
        }
    }

    //Dodawanie nowego praktykanta do tabeli
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        string firstNameStr = firstName.Text;
        string lastNameStr = lastName.Text;
        string desiredPositionStr = desiredPosition.Text;
        string phoneNumberStr = phoneNumber.Text;
        string emailStr = email.Text;

        if (!String.IsNullOrEmpty(firstNameStr)&&!String.IsNullOrEmpty(lastNameStr)&&!String.IsNullOrEmpty(phoneNumberStr)&&!String.IsNullOrEmpty(emailStr)&&!String.IsNullOrEmpty(dateSubmitted.Text)) {
            DateTime dateSubmittedStr = DateTime.Parse(dateSubmitted.Text);
            Functions.querryCommand(String.Format("INSERT INTO dbo.Praktykanci (firstName,lastName,desiredPosition,dateSubmitted,phoneNumber,email) VALUES ('{0}','{1}','{2}','{3}','{4}','{5}');",firstNameStr,lastNameStr,desiredPositionStr,dateSubmittedStr.ToString("yyyy-MM-dd"),phoneNumberStr,emailStr));

            gridView1.DataBind();

            firstName.Text = null;
            lastName.Text = null;
            desiredPosition.SelectedIndex = 0;
            phoneNumber.Text = null;
            email.Text = null;

            alertSpan.Visible = false;
        }
        else
        {
            alertSpan.Visible = true;
        }
    }
}