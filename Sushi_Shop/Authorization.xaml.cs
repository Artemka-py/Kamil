using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
namespace Sushi_Shop
{
    /// <summary>
    /// Логика взаимодействия для Authorization.xaml
    /// </summary>
    public partial class Authorization : Window
    {

        private string QR = "";

        DBProcedures procedures = new DBProcedures();

        public Authorization()
        {
            InitializeComponent();
        }

        private void Dependency_OnChange(object sender, SqlNotificationEventArgs e)
        {
            if (e.Info != SqlNotificationInfo.Invalid)
                dgFill(QR);
        }

        private void dgFill(string qr)
        {
            Action action = () =>
            {
                DBConnection connection = new DBConnection();
                DBConnection.qrBlida = qr;
                connection.BlidaFill();
                connection.Dependency.OnChange += Dependency_OnChange;
                dgAuthorization.ItemsSource = connection.dtBlida.DefaultView;
                dgAuthorization.Columns[0].Visibility = Visibility.Collapsed;
            };

            Dispatcher.Invoke(action);
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrBlida;
            dgFill(QR);
        }
    }
}
