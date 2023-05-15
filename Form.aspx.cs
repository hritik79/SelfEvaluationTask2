using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlSelect position = (HtmlSelect)FindControl("dposition");

        string conn = "Server = 127.0.0.1; Database = empdata; Uid = root; Pwd = hritik@79";
        using (MySqlConnection connection = new MySqlConnection(conn))
        {
            connection.Open();
            string query = "SELECT * FROM positions";
            using (MySqlCommand command = new MySqlCommand(query, connection))
            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    string position_id = reader["position_id"].ToString();
                    string positions = reader["positions"].ToString();
                    var listitem = new ListItem(positions, position_id);
                    position.Items.Add(listitem);

                }
            }
        }
    }

    [WebMethod]

    public static void AddDataToDataBase(string title, string fname, string lname, string position, string arena, string emp_type, string skill, string street, string date, string zipcode, string country, string code, string contact, string email)
    {
        string MyConnection = "Server = 127.0.0.1; Database = empdata; Uid = root; Pwd = hritik@79";
        using (MySqlConnection connection = new MySqlConnection(MyConnection))
        {
            connection.Open();
            string query = "INSERT INTO personal ('first_name', 'last_name', 'date_of_birth', 'title', 'employee_type', 'position_id') VALUES (" + @fname + ',' + @lname + ',' + @date +',' + @title +',' + @emp_type +',' + @position +")";
            using (MySqlCommand cmd = new MySqlCommand(query, connection))
            {
                cmd.ExecuteNonQuery();
            }


            connection.Close();
        }
    }
}