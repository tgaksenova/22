using System;
using System.Collections.Generic;
using System.ComponentModel;
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
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(TextBoxLogin.Text) || string.IsNullOrEmpty(PasswordBox.Password))
            {
                MessageBox.Show("Введите логин и пароль!");
                return;
            }
            using (var db = new MortgageCalculatorEntities())
            {
                var user = db.regist
                .AsNoTracking()
                .FirstOrDefault(u => u.login_user == TextBoxLogin.Text && u.password_user == PasswordBox.Password);
                if (user == null)
                {
                    MessageBox.Show("Пользователь с такими данными не найден!");
                    return;
                }
                else
                {
                    MessageBox.Show("Пользователь успешно найден!");
                    //Переход на страницу меню для определенной роли пользователя
                    switch (user.is_admin)
                    {
                        case true:
                            NavigationService?.Navigate(new CreditorMenu());
                            break;
                        case false:
                            NavigationService?.Navigate(new CastomerMenu());
                            break;

                    }
                }


            }

        }
    }
}
