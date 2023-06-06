using ClosedXML.Excel;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class excelConvert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GetData();
    }

    public void GetData()
    {
        string MyConnection = "server=127.0.0.1; user=root; password=hritik@79; database=empdata";
        MySqlConnection con = new MySqlConnection(MyConnection);
        DataSet ds = new DataSet();

        string query = "SELECT personal.first_name, personal.last_name, personal.date_of_birth, personal.title, personal.employee_type, \r\npositions.position_name, contact.contact, contact.email, contact.codes, address.street_name, address.zipcode, place.place, country.country,\r\n    GROUP_CONCAT(DISTINCT skills.skills) as skills\r\n\tFROM personal\r\n\tLEFT JOIN positions ON personal.position_id = positions.position_id\r\n\tJOIN contact ON personal.pid = contact.pid\r\n\tJOIN address ON personal.pid = address.pid\r\n\tJOIN place ON address.place_id = place.place_id\r\n\tJOIN country ON address.country_id = country.country_id\r\n\tJOIN skilldetail ON personal.pid = skilldetail.pid\r\n\tJOIN skills ON skilldetail.skill_id = skills.skill_id\r\n    WHERE is_deleted = 0\r\n    GROUP BY personal.pid, personal.position_id, contact.cid, address.street_name, address.zipcode, place.place, country.country;";
        con.Open();
        MySqlDataAdapter adapter = new MySqlDataAdapter(query, con);
        adapter.Fill(ds);

        using (XLWorkbook wb = new XLWorkbook())
        {
            DataTable dt = new DataTable("ExportedData");
            foreach (DataColumn column in ds.Tables[0].Columns)
            {
                dt.Columns.Add(column.ColumnName);
            }

            DataRow dr = dt.NewRow();
            foreach (DataColumn column in ds.Tables[0].Columns)
            {
                dr[column.ColumnName] = column.ColumnName;
            }
            dt.Rows.Add(dr);
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                dt.ImportRow(row);
            }

            var ws = wb.Worksheets.Add(dt.TableName);
            ws.Cell(1, 1).InsertData(dt.Rows);
            ws.Columns().AdjustToContents();

            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment;filename=ExportedData.xlsx");
            using (MemoryStream MyMemoryStream = new MemoryStream())
            {
                wb.SaveAs(MyMemoryStream);
                MyMemoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }
    }
}