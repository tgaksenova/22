using System;
using System.Collections.Generic;
using System.Data.Entity;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace crd
{
    /// <summary>
    /// Логика взаимодействия для CastomerMenu.xaml
    /// </summary>
    public partial class CastomerMenu : Page
    {
        public CastomerMenu()
        {
            InitializeComponent();
        }

       

        private void Button_Click_CreditsPrograms(object sender, RoutedEventArgs e)
        {
            CastomerFrame.Content = new CreditProgramsPage();
        }

        private void Button_Click_PropetriesPage(object sender, RoutedEventArgs e)
        {
            CastomerFrame.Content = new PropertiesPage();
        }

        private void Button_Click_CreditDetailsPage(object sender, RoutedEventArgs e)
        {
            CastomerFrame.Content = new CreditDetailsPage();
        }

        private void Button_Click_ReportsPage(object sender, RoutedEventArgs e)
        {
            CastomerFrame.Content = new ReportsPage();
        }
    }
}
