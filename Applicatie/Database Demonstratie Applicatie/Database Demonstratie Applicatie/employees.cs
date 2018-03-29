using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Database_Demonstratie_Applicatie
{
    public partial class employees : Form
    {
        SqlConnection Database;
        public employees(SqlConnection Database)
        {
            this.Database = Database;
            InitializeComponent();
        }

        private void employees_Load(object sender, EventArgs e)
        {
            SqlDataReader myReader = null;
            SqlCommand myCommand = new SqlCommand("SELECT * FROM Employee", Database);
            myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                int count = myReader.FieldCount;
                String line = "";
                for (int i = 0; i < count; i++)
                {
                    line += myReader.GetValue(i) + "|";
                }
                dataGridView1.Rows.Add(line.Split('|'));
            }
            myReader.Close();
        }
    }
}
