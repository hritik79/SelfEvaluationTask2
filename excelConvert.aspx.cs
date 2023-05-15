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

        string query = "CALL get_empdata();";
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