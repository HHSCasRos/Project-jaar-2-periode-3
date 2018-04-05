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
using System.Globalization;

namespace Database_Demonstratie_Applicatie
{
    public partial class booking : Form
    {
        SqlConnection Database;
        public booking(SqlConnection Database)
        {
            this.Database = Database;
            InitializeComponent();
        }

        private void booking_Load(object sender, EventArgs e)
        {
            SqlDataReader myReader = null;
            SqlCommand myCommand = new SqlCommand("SELECT * FROM Vacation", Database);
            myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
               comboBox1.Items.Add("Vacation " + myReader["Vac_Id"].ToString() + " (" + myReader["Duration"].ToString() + " Days - €" + myReader["Price"].ToString() + ")");
            }
            myReader.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                int vac_id = Convert.ToInt32(comboBox1.SelectedItem.ToString().Split(' ')[1]);
                /*
                 * 

                String startdate = monthCalendar1.SelectionStart.ToLongDateString();
                DateTime date = DateTime.Parse(startdate, System.Globalization.CultureInfo.InvariantCulture);

                string datestring = date.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
                //MessageBox.Show(datestring);
                */
                int year = monthCalendar1.SelectionStart.Year;
                int month = monthCalendar1.SelectionStart.Month;
                int day = monthCalendar1.SelectionStart.Day;

                //MessageBox.Show(year + " " + month + " " + day);

                String date = year + "-" + month + "-" + day;

                SqlCommand Hoi = new SqlCommand("INSERT INTO Booking (Vac_Id, Transport_To, Transport_From, Start_Date) VALUES ('" + vac_id + "', '" + textBox1.Text + "', '" + textBox2.Text + "', '" + date + "')", Database);
                Hoi.ExecuteNonQuery();
                MessageBox.Show("Booking Created");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

        }

		private void booking_FormClosing(object sender, FormClosingEventArgs e)
		{
			e.Cancel = true;
			this.Hide();
			Form1 form1 = new Form1();
			form1.Show();
		}
	}
}
