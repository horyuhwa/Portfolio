using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;

namespace APISun
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string locationstr=textBox1.Text;
            string locdatestr = textBox2.Text;

            string url = "http://apis.data.go.kr/B090041/openapi/service/RiseSetInfoService/getAreaRiseSetInfo"; // URL
            url += "?ServiceKey=" + "POhABzIpaBdsd68TyYxCpXEYEaOFzEl2uUSVzW0mf7RCsIaszjXz8p5LspD9momiWBYKhXLB8uhO5GSezu4blQ%3D%3D"; // Service Key
            url += "&locdate="+locdatestr;
            url += "&location="+locationstr;

            XElement x = XElement.Load(url);

            var output = from item in x.Descendants("item")
                         select
                         new Sun()
                         {
                             location = item.Element("location").Value,
                             locdate = int.Parse(item.Element("locdate").Value),
                             sunrise = int.Parse(item.Element("sunrise").Value),
                             sunset = int.Parse(item.Element("sunset").Value)
                         };
            List<Sun> s = output.ToList<Sun>();

            dataGridView1.DataSource = null;
            dataGridView1.DataSource = s;
        }
    }
}