using System;
using System.Collections.ObjectModel;
using System.Configuration;
using System.Data.SqlClient;
public class Functions
{


    public static void querryCommand(string command)
    {
        try
        {
            SqlConnection conn = new SqlConnection("Server=DESKTOP-PKS95F4; Database=Praktykanci; Integrated Security=TRUE;");

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = command;
            cmd.ExecuteNonQuery();

            conn.Close();
        }
        catch
        {

        }
    }
}
