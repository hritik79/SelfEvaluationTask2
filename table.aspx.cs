using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using static table;

public partial class table : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string conn = "server=127.0.0.1;username=root;password=hritik@79;database=empdata;";

        HtmlSelect countrys = (HtmlSelect)FindControl("country");

        using (MySqlConnection connection = new MySqlConnection(conn))
        {
            connection.Open();

            string query = "SELECT * FROM empdata.country;";

            using (MySqlCommand command = new MySqlCommand(query, connection))
            {
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string country_id = reader["country_id"].ToString();
                        string country = reader["country"].ToString();
                        var listitem1 = new ListItem(country, country_id);
                        countrys.Items.Add(listitem1);
                    }
                }
            }
            connection.Close();
        }
    }

    [WebMethod]
    public static string GetAddCodes(int countryId)
    {
        string conn = "server=127.0.0.1;username=root;password=hritik@79;database=empdata;";
        using (MySqlConnection connection = new MySqlConnection(conn))
        {
            connection.Open();

            string query = "SELECT codes FROM empdata.country WHERE country_id=" + countryId + ";";

            using (MySqlCommand command = new MySqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@countryId", countryId);
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        string codes = reader["codes"].ToString();
                        return codes;
                    }
                }
            }
        }
        return "success";
    }

    /*[WebMethod]
    public static string GetDataFromDatabase()
    {
        string connString = "server=127.0.0.1; user=root; password=hritik@79; database=empdata";
        MySqlConnection con = new MySqlConnection(connString);
        DataTable dt = new DataTable();

        con.Open();
        MySqlDataAdapter adapter = new MySqlDataAdapter("CALL get_empdata();", con);
        adapter.Fill(dt);

        string json = JsonConvert.SerializeObject(dt);
        return json;
    }*/

    [WebMethod]
    public static string GetDataFromDatabase()

    {
        string MyConnection = "server=127.0.0.1; user=root; password=hritik@79; database=empdata";
        MySqlConnection con = new MySqlConnection(MyConnection);
        DataTable dt = new DataTable();

        con.Open();
        MySqlDataAdapter adapter = new MySqlDataAdapter("CALL get_empdata();", con);
        adapter.Fill(dt);
        ArrayList arrpid = new ArrayList();
        List<Employee> employees = new List<Employee>();
        foreach (DataRow dr in dt.Rows)
        {
            string pid = dr["pid"].ToString();
            if (arrpid.Contains(pid))
            {
                continue;
            }
            else
            {
                arrpid.Add(pid);
            }
            string searchExpression = "pid =" + pid;
            DataRow[] foundrows = dt.Select(searchExpression);
            ArrayList skill = new ArrayList();
            ArrayList skillid = new ArrayList();
            foreach (DataRow foundrow in foundrows)
            {
                if (foundrows.Length > 1)
                {
                    skill.Add(foundrow["skills"]);
                    skillid.Add(foundrow["skill_id"]);
                }
            }
            Employee employee = new Employee
            {
                pid = dr["pid"].ToString(),
                first_name = dr["first_name"].ToString(),
                last_name = dr["last_name"].ToString(),
                date_of_birth = ((DateTime)dr["date_of_birth"]).ToString("yyyy-MM-dd hh:mm:ss tt"),
                title = dr["title"].ToString(),
                employee_type = dr["employee_type"].ToString(),
                arena = dr["arena"].ToString(),
                position_id = dr["position_id"].ToString(),
                position_name = dr["position_name"].ToString(),
                contact = dr["contact"].ToString(),
                email = dr["email"].ToString(),
                codes = dr["codes"].ToString(),
                street_name = dr["street_name"].ToString(),
                zipcode = dr["zipcode"].ToString(),
                place = dr["place"].ToString(),
                country = dr["country"].ToString(),
                country_id = dr["country_id"].ToString(),
                skill = skill,
                skillid = skillid
            };
            employees.Add(employee);
        }

        string json = JsonConvert.SerializeObject(employees);
        return json;
    }
    public class Employee
    {
        public string pid { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string date_of_birth { get; set; }
        public string title { get; set; }
        public string position_id { get; set; }
        public string employee_type { get; set; }
        public string arena { get; set; }
        public string place { get; set; }
        public string country { get; set; }
        public string country_id { get; set; }
        public string position_name { get; set; }
        public string contact { get; set; }
        public string email { get; set; }
        public string codes { get; set; }
        public string street_name { get; set; }
        public string zipcode { get; set; }
        public ArrayList skill { get; set; }
        public ArrayList skillid { get; set; }

    }

    [WebMethod]
    public static void DeleteData(string pid)
    {
        string MyConnection = "server=127.0.0.1;username=root;password=hritik@79;database=empdata;";
        using (MySqlConnection conn = new MySqlConnection(MyConnection))
        {
            conn.Open();
            string query = "UPDATE empdata.personal SET is_deleted = 1 WHERE pid IN (" + @pid + ");";
            using (MySqlCommand cmd = new MySqlCommand(query, conn))
            {
                cmd.ExecuteNonQuery();
            }
            conn.Close();
        }
    }

    [WebMethod]
    public static void AddContact(string pid, string contact, string email, string code)
    {
        string MyConnection = "server=127.0.0.1;username=root;password=hritik@79;database=empdata;";
        using (MySqlConnection conn = new MySqlConnection(MyConnection))
        {
            conn.Open();
            string query = "UPDATE empdata.contact SET contact ='" + contact + "','";
            using (MySqlCommand cmd = new MySqlCommand(query, conn))
            {
                cmd.ExecuteNonQuery();
            }
            conn.Close();
        }
    }
}