using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using System.Data.SqlClient;
namespace Database_Demonstratie_Applicatie
{

    public partial class Form1 : Form
    {
        SqlConnection Database;
        public Form1()
        {
            InitializeComponent();
            Database = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=OutdoorParadise2;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            try
            {
                Database.Open();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
                button1.Enabled = false;
                button2.Enabled = false;
                MessageBox.Show("A connection to the database could not be made. Check connection string?", "Connection could not be made", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            booking booking = new booking(Database);
            booking.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            employees employees = new employees(Database);
            employees.Show();
            this.Hide();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
