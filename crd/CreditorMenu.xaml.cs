using System;
using System.Collections.Generic;
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
    /// Логика взаимодействия для CreditorMenu.xaml
    /// </summary>
    public partial class CreditorMenu : Page
    {


        public CreditorMenu()
        {
            InitializeComponent();
        }

        private void Button_Click_CreditsPrograms1(object sender, RoutedEventArgs e)
        {
            CreditorFrame.Content = new CreditProgramsPage();
        }

        private void Button_Click_PropetriesPage1(object sender, RoutedEventArgs e)
        {
            CreditorFrame.Content = new PropertiesPage();
        }

        private void Button_Click_CreditDetailsPage1(object sender, RoutedEventArgs e)
        {
            CreditorFrame.Content = new CreditDetailsPage();
        }

        private void Button_Click_ReportsPage1(object sender, RoutedEventArgs e)
        {
            CreditorFrame.Content = new ReportsPage();
        }
    }
}
