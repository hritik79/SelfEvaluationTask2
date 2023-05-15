using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Relational;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.Expressions;
using System.Xml.Linq;
using static Form;

public partial class Form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string conn = "server=127.0.0.1;username=root;password=hritik@79;database=empdata;";

        HtmlSelect position = (HtmlSelect)FindControl("dposition");

        using (MySqlConnection connection = new MySqlConnection(conn))
        {
            connection.Open();

            string query = "SELECT * FROM empdata.positions;";

            using (MySqlCommand command = new MySqlCommand(query, connection))
            {
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string position_id = reader["position_id"].ToString();
                        string positions = reader["position_name"].ToString();
                        var listitem = new ListItem(positions, position_id);
                        position.Items.Add(listitem);
                    }
                }
            }
            connection.Close();
        }
        
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

        HtmlSelect skill = (HtmlSelect)FindControl("skill");
        using (MySqlConnection connection = new MySqlConnection(conn))
        {
            string query = "SELECT * FROM empdata.skills";

            MySqlCommand command = new MySqlCommand(query, connection);
            connection.Open();
            MySqlDataReader reader = command.ExecuteReader();

            skill.DataSource = reader;
            skill.DataTextField = "skills";
            skill.DataValueField = "skill_id";
            skill.DataBind();

            reader.Close();
            connection.Close();
        }
    }

    public class Place
    {
        public int countryId { get; set; }
        public string PlaceId { get; set; }
        public string Country { get; set; }
    }

    [WebMethod]
    public static List<Place> GetPlaces(int countryId)
    {
        string conn = "server=127.0.0.1;username=root;password=hritik@79;database=empdata;";
        List<Place> places = new List<Place>();

        using (MySqlConnection connection = new MySqlConnection(conn))
        {
            connection.Open();

            string query = "SELECT * FROM empdata.place WHERE country_id=" + countryId + ";";

            using (MySqlCommand command = new MySqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@countryId", countryId);

                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string placeId = reader["place_id"].ToString();
                        string placeCountry = reader["place"].ToString();

                        Place place = new Place
                        {
                            PlaceId = placeId,
                            Country = placeCountry
                        };

                        places.Add(place);
                    }
                }
            }

            connection.Close();
        }

        return places;
    }

    [WebMethod]
    public static string GetCodes(int countryId)
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

    [WebMethod]

    public static void AddDataToDataBase(string title, string fname, string lname, string position, string arena, string emp_type, string skill, string street, string date, string zipcode, string place, string country, string code, string contact, string email)
    {
        string MyConnection = "server=127.0.0.1;username=root;password=hritik@79;database=empdata;";
        using (MySqlConnection connection = new MySqlConnection(MyConnection))
        {
            connection.Open();
            string query1 = "INSERT INTO empdata.personal (first_name, last_name, date_of_birth, title, employee_type, position_id,arena) VALUES ('" + @fname + "','" + @lname + "','" + @date + "','" + @title + "','" + @emp_type + "','" + @position + "','" + @arena + "');";
            using (MySqlCommand cmd = new MySqlCommand(query1, connection))
            {
                cmd.ExecuteNonQuery();
            }

            int personalId;
            using (MySqlCommand cmd = new MySqlCommand("SELECT LAST_INSERT_ID()", connection))
            {
                personalId = Convert.ToInt32(cmd.ExecuteScalar());
            }

            string query2 = "INSERT INTO empdata.contact(pid,contact,email,codes) VALUES('" + personalId + "','" + @contact + "','" + @email + "','" + @code + "');";

            using (MySqlCommand cmd = new MySqlCommand(query2, connection))
            {
                cmd.ExecuteNonQuery();
            }

            string[] skills = skill.Split(',');
            foreach (string skillValue in skills)
            {
                string query3 = "INSERT INTO empdata.skilldetail(pid,skill_id) VALUES('" + personalId + "','" + skillValue + "');";

                using (MySqlCommand cmd = new MySqlCommand(query3, connection))
                {
                    cmd.ExecuteNonQuery();
                }
            }

            string query4 = "INSERT INTO empdata.address(pid,street_name,zipcode,place_id,country_id) VALUES('" + personalId + "','" + @street + "','" + @zipcode + "','" + @place + "','" + @country + "');";

            using (MySqlCommand cmd = new MySqlCommand(query4, connection))
            {
                cmd.ExecuteNonQuery();
            }
            connection.Close();
        }
    }

    [WebMethod]
    public static void UpdateDataToDataBase(string pid, string title, string fname, string lname, string position, string arena, string emp_type, string skill, string street, string date, string zipcode, string place, string country, string code, string contact, string email)
    {
        string MyConnection = "server=127.0.0.1;username=root;password=hritik@79;database=empdata;";
        using (MySqlConnection connection = new MySqlConnection(MyConnection))
        {
            connection.Open();
            string query = "Update empdata.personal SET is_deleted = 1 WHERE pid=" + @pid + ";";
            using (MySqlCommand cmnd = new MySqlCommand(query, connection))
            {
                cmnd.ExecuteNonQuery();
            }

            string query1 = "INSERT INTO empdata.personal (first_name, last_name, date_of_birth, title, employee_type, position_id,arena) VALUES ('" + @fname + "','" + @lname + "','" + @date + "','" + @title + "','" + @emp_type + "','" + @position + "','" + @arena + "');";
            using (MySqlCommand cmnd = new MySqlCommand(query1, connection))
            {
                cmnd.ExecuteNonQuery();
            }

            int personalId;
            using (MySqlCommand cmd = new MySqlCommand("SELECT LAST_INSERT_ID()", connection))
            {
                personalId = Convert.ToInt32(cmd.ExecuteScalar());
            }

            string query2 = "INSERT INTO empdata.contact(pid,contact,email,codes) VALUES('" + personalId + "','" + @contact + "','" + @email + "','" + @code + "');";

            using (MySqlCommand cmnd = new MySqlCommand(query2, connection))
            {
                cmnd.ExecuteNonQuery();
            }

            string[] skills = skill.Split(',');
            foreach (string skillValue in skills)
            {
                string query3 = "INSERT INTO empdata.skilldetail(pid,skill_id) VALUES('" + personalId + "','" + skillValue + "');";

                using (MySqlCommand cmnd = new MySqlCommand(query3, connection))
                {
                    cmnd.ExecuteNonQuery();
                }
            }

            string query4 = "INSERT INTO empdata.address(pid,street_name,zipcode,place_id,country_id) VALUES('" + personalId + "','" + @street + "','" + @zipcode + "','" + @place + "','" + @country + "');";

            using (MySqlCommand cmnd = new MySqlCommand(query4, connection))
            {
                cmnd.ExecuteNonQuery();
            }
            connection.Close();
        }
    }
}

