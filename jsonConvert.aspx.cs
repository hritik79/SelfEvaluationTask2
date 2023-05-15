using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class jsonConvert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string MyConnection = "server=127.0.0.1; user=root; password=hritik@79; database=empdata";
        MySqlConnection con = new MySqlConnection(MyConnection);
        DataTable dt = new DataTable();

        con.Open();
        MySqlDataAdapter adapter = new MySqlDataAdapter("CALL get_empdata();", con);
        adapter.Fill(dt);

        string json = JsonConvert.SerializeObject(dt);
        Response.ContentType = "application/json; charset=utf-8";
        Response.Write(json);
        Response.End();
    }
}