﻿using System;
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
                SqlCommand Hoi = new SqlCommand("INSERT INTO Booking (Vac_Id, Transport_To, Transport_From, Start_Date) VALUES ('" + vac_id + "', '" + textBox1.Text + "', '" + textBox2.Text + "', '" + monthCalendar1.SelectionStart.ToLongDateString() + "')", Database);
                Hoi.ExecuteNonQuery();
                MessageBox.Show("Booking Created");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

        }
    }
}
