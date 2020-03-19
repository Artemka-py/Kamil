using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Sushi_Shop
{
    class DBConnection
    {

        public static SqlConnection connection = new SqlConnection("Data Source = WIN-IQFTLL160JT\\SQLEXPRESS; Initial Catalog = Sushi; Integrated Security Info = true;");
        public SqlDependency Dependency = new SqlDependency();

        public DataTable dtRole = new DataTable("Role");
        public DataTable dtAuthorization = new DataTable("Authorization");
        public DataTable dtSotrudniki = new DataTable("Sotrudniki"); 
        public DataTable dtBlida = new DataTable("Blida"); 
        public DataTable dtChek = new DataTable("Chek"); 
        public DataTable dtDolgnost = new DataTable("Dolgnost");
        public DataTable dtKlinet = new DataTable("Klinet");
        public DataTable dtOtdel = new DataTable("Otdel");
        public DataTable dtPostavhik = new DataTable("Postavhik");
        public DataTable dtPrikaz_o_Prieme = new DataTable("Prikaz_o_Prieme");
        public DataTable dtPrikaz_ob_Ovolen = new DataTable("Prikaz_ob_Ovolen");
        public DataTable dtRezume = new DataTable("Rezume");
        public DataTable dtSoiskatel = new DataTable("Soiskatel");
        public DataTable dtZakaz = new DataTable("Zakaz");

        

        public static string qrRole = "SELECT [ID_Role], [Name_Role] FROM [dbo].[Role]",
        qrAuthorization = "SELECT [ID_Authorization], [Login], [Password], [Name_Role], [Dostuo_of_Role] FROM [dbo].[Authorization]" +
        " inner join [dbo].[Role] on [dbo].[Authorization].[ID_Role] = [dbo].[Role].[ID_Role]",
        qrSotrudniki = "SELECT [ID_Sotrudnika], [Familia_Sotrudnika], [Name_Sotrudnika], [Otchestvo_Sotrudnika], [Seria_Document], [Number_Document], [Name_Dolgnost], [Login], [Password], [Name_Dolgnost] FROM [dbo].[Sotrudniki]" +
         " inner join [dbo].[Dolgnost] on [dbo].[Sotrudniki].[ID_Dolgnost] = [dbo].[Dolgnost].[ID_Dolgnost]" +
         " inner join [dbo].[Authorization] on [dbo].[Sotrudniki].[ID_Authorization] = [dbo].[Authorization].[ID_Authorization]" +
         " inner join [dbo].[Prikaz_o_Prieme] on [dbo].[Sotrudniki].[ID_Prikaz_o_Prieme] = [dbo].[Prikaz_o_Prieme].[ID_Prikaz_o_Prieme]",
        qrBlida = "SELECT [ID_Blida], [Name_Blida], [Prica_Blide], [Familia_Postavhik] FROM [dbo].[Blida]" +
        " inner join [dbo].[Postavhik] on [dbo].[Blida].[ID_Blida] = [dbo].[Postavhik].[ID_Postavhik]",
        qrChek = "SELECT [ID_Chek], [Number_of_Check], [Familia_Sotrudnika], [ID_Blida] FROM [dbo].[Chek]" +
         " inner join [dbo].[Sotrudniki] on [dbo].[Chek].[ID_Sotrudnika] = [dbo].[Sotrudniki].[ID_Sotrudnika]" +
         " inner join [dbo].[Zakaz] on [dbo].[Chek].[ID_Zakaz] = [dbo].[Zakaz].[ID_Zakaz]",
        qrDolgnost = "SELECT [ID_Dolgnost], [Name_Dolgnost], [Oklad_of_Dolgnost], [Name_Otdel] FROM [dbo].[Dolgnost]" +
        " inner join [dbo].[Otdel] on [dbo].[Dolgnost].[ID_Otdel] = [dbo].[Otdel].[ID_Otdel]",
        qrKlinet = "SELECT [ID_Klinet], [Familia_Klinet], [Name_Klinet], [Otchestvo_Klinet], [Nomet_Telefona] FROM [dbo].[Klinet]",
        qrOtdel = "SELECT [ID_Otdel], [Name_Otdel] FROM [dbo].[Otdel]",
        qrPostavhik = "SELECT [ID_Postavhik], [Familia_Postavhik], [Name_Postavhik], [Otchestvo_Postavik], [Seria_Document], [Nomer_Document] FROM [dbo].[Postavhik]",
        qrPrikaz_o_Prieme = "SELECT [ID_Prikaz_o_Prieme], [Name_Dolgnost], [Familia_Soiskatel] FROM [dbo].[Prikaz_o_Prieme]" +
         " inner join [dbo].[Dolgnost] on [dbo].[Prikaz_o_Prieme].[ID_Dolgnost] = [dbo].[Dolgnost].[ID_Dolgnost]" +
         " inner join [dbo].[Soiskatel] on [dbo].[Prikaz_o_Prieme].[ID_Soiskatel] = [dbo].[Soiskatel].[ID_Soiskatel]",
        qrPrikaz_ob_Ovolen = "SELECT [ID_Prikaz_ob_Ovolen], [Nomer_Prikaz], [Prichina], [Familia_Sotrudnika] FROM [dbo].[Prikaz_ob_Ovolen]" +
        "inner join [dbo].[Sotrudniki] on [dbo].[Prikaz_ob_Ovolen].[ID_Sotrudnika] = [dbo].[Sotrudniki].[ID_Sotrudnika]",
        qrRezume = "SELECT [ID_Rezume], [Familia_Soiskatel], [Cel], [Obrazovanii], [Opit_Raboti], [Proff_Naviki] FROM [dbo].[Rezume]" +
        " inner join [dbo].[Soiskatel] on [dbo].[Rezume].[ID_Soiskatel] = [dbo].[Soiskatel].[ID_Soiskatel]",
        qrSoiskatel = "SELECT [ID_Soiskatel], [Familia_Soiskatel], [Name_Soiskatel], [Otchestvo_Soiskatel], [Seria_Document], [Nomer_Document], [Data_Rojdrnia] FROM [dbo].[Soiskatel]",
        qrZakaz = "SELECT [ID_Zakaz], [Name_Blida], [Familia_Klinet] FROM [dbo].[Zakaz]" +
         " inner join [dbo].[Klinet] on [dbo].[Zakaz].[ID_Klinet] = [dbo].[Klinet].[ID_Klinet]" +
         " inner join [dbo].[Blida] on [dbo].[Zakaz].[ID_Blida] = [dbo].[Blida].[ID_Blida]";




        private SqlCommand command = new SqlCommand("", connection);

        private void dtFill(DataTable table, string query)
        {
            command.CommandText = query;

            //Технология "Real Time"
            command.Notification = null;
            Dependency.AddCommandDependency(command);
            SqlDependency.Start(connection.ConnectionString);

            connection.Open();
            table.Load(command.ExecuteReader());
            connection.Close();
        }

        public void AuthorizationFill()
        {
            dtFill(dtAuthorization, qrAuthorization);
        }

        public void RoleFill()
        {
            dtFill(dtRole, qrRole);
        }

        public void SotrudnikiFill()
        {
            dtFill(dtSotrudniki, qrSotrudniki);
        }

        public void BlidaFill()
        {
            dtFill(dtBlida, qrBlida);
        }

        public void ChekFill()
        {
            dtFill(dtChek, qrChek);
        }

        public void DolgnostFill()
        {
            dtFill(dtDolgnost, qrDolgnost);
        }

        public void KlinetFill()
        {
            dtFill(dtKlinet, qrKlinet);
        }

        public void OtdelFill()
        {
            dtFill(dtOtdel, qrOtdel);
        }

        public void PostavhikFill()
        {
            dtFill(dtPostavhik, qrPostavhik);
        }

        public void Prikaz_o_PriemeFill()
        {
            dtFill(dtPrikaz_o_Prieme, qrPrikaz_o_Prieme);
        }

        public void Prikaz_ob_OvolenFill()
        {
            dtFill(dtPrikaz_ob_Ovolen, qrPrikaz_ob_Ovolen);
        }

        public void RezumeFill()
        {
            dtFill(dtRezume, qrRezume);

        }
        public void SoiskatelFill()
        {
                dtFill(dtSoiskatel, qrSoiskatel);
        }

        public void ZakazFill()
        {
            dtFill(dtZakaz, qrZakaz);
        }


    }
}
