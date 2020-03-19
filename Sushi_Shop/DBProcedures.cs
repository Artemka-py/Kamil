using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Sushi_Shop
{
    class DBProcedures
    {
        private SqlCommand command = new SqlCommand("", DBConnection.connection);

        private void commandConfig(string config)
        {
            command.CommandType =
            System.Data.CommandType.StoredProcedure;
            command.CommandText = "[dbo].[" + config + "]";
            command.Parameters.Clear();
        }


        public void Authorization_IU(Int32 ID_Authorization, string Login, string Password, Int32 ID_Role)
        {
            commandConfig("Authorization_IU");
            command.Parameters.AddWithValue("@ID_Authorization", ID_Authorization);
            command.Parameters.AddWithValue("@Login", Login);
            command.Parameters.AddWithValue("@Password", Password);
            command.Parameters.AddWithValue("@ID_Role", ID_Role);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Authorization_IU(string Login, string Password, Int32 ID_Role)
        {
            commandConfig("Authorization_IU");
            command.Parameters.AddWithValue("@Login", Login);
            command.Parameters.AddWithValue("@Password", Password);
            command.Parameters.AddWithValue("@ID_Role", ID_Role);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Authorization_D(Int32 ID_Authorization)
        {
            commandConfig("Authorization_D");
            command.Parameters.AddWithValue("@ID_Authorization", ID_Authorization);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }



        public void Role_IU(Int32 ID_Role, string Name_Role, string Dostuo_of_Role)
        {
            commandConfig("Role_IU");
            command.Parameters.AddWithValue("@ID_Role", ID_Role);
            command.Parameters.AddWithValue("@Name_Role", Name_Role);
            command.Parameters.AddWithValue("@Dostuo_of_Role", Dostuo_of_Role);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Role_IU(string Name_Role, string Dostuo_of_Role)
        {
            commandConfig("Role_IU");
            command.Parameters.AddWithValue("@Name_Role", Name_Role);
            command.Parameters.AddWithValue("@Dostuo_of_Role", Dostuo_of_Role);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Role_D(Int32 ID_Role)
        {
            commandConfig("Role_D");
            command.Parameters.AddWithValue("@ID_Role", ID_Role);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Sotrudniki_IU(Int32 ID_Sotrudnika, string Familia_Sotrudnika, string Name_Sotrudnika, string Otchestvo_Sotrudnika, string Seria_Document, string Number_Document, Int32 ID_Dolgnost, Int32 ID_Authorization, Int32 ID_Prikaz_o_Prieme)
        {
            commandConfig("Sotrudniki_IU");
            command.Parameters.AddWithValue("@ID_Sotrudnika", ID_Sotrudnika);
            command.Parameters.AddWithValue("@Familia_Sotrudnika", Familia_Sotrudnika);
            command.Parameters.AddWithValue("@Name_Sotrudnika", Name_Sotrudnika);
            command.Parameters.AddWithValue("@Otchestvo_Sotrudnika", Otchestvo_Sotrudnika);
            command.Parameters.AddWithValue("@Seria_Document", Seria_Document);
            command.Parameters.AddWithValue("@Number_Document", Number_Document);
            command.Parameters.AddWithValue("@ID_Dolgnost", ID_Dolgnost);
            command.Parameters.AddWithValue("@ID_Authorization", ID_Authorization);
            command.Parameters.AddWithValue("@ID_Prikaz_o_Prieme", ID_Prikaz_o_Prieme);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Sotrudniki_IU(string Familia_Sotrudnika, string Name_Sotrudnika, string Otchestvo_Sotrudnika, string Seria_Document, string Number_Document, Int32 ID_Dolgnost, Int32 ID_Authorization, Int32 ID_Prikaz_o_Prieme)
        {
            commandConfig("Sotrudniki_IU");
            command.Parameters.AddWithValue("@Familia_Sotrudnika", Familia_Sotrudnika);
            command.Parameters.AddWithValue("@Name_Sotrudnika", Name_Sotrudnika);
            command.Parameters.AddWithValue("@Otchestvo_Sotrudnika", Otchestvo_Sotrudnika);
            command.Parameters.AddWithValue("@Seria_Document", Seria_Document);
            command.Parameters.AddWithValue("@Number_Document", Number_Document);
            command.Parameters.AddWithValue("@ID_Dolgnost", ID_Dolgnost);
            command.Parameters.AddWithValue("@ID_Authorization", ID_Authorization);
            command.Parameters.AddWithValue("@ID_Prikaz_o_Prieme", ID_Prikaz_o_Prieme);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Sotrudniki_D(Int32 ID_Sotrudnika)
        {
            commandConfig("Sotrudniki_D");
            command.Parameters.AddWithValue("@ID_Sotrudnika", ID_Sotrudnika);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Blida_IU(Int32 ID_Blida, string Name_Blida, Int32 Prica_Blide, Int32 ID_Postavhik)
        {
            commandConfig("Blida_IU");
            command.Parameters.AddWithValue("@ID_Blida", ID_Blida);
            command.Parameters.AddWithValue("@Name_Blida", Name_Blida);
            command.Parameters.AddWithValue("@Prica_Blide", Prica_Blide);
            command.Parameters.AddWithValue("@ID_Postavhik", ID_Postavhik);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Blida_IU(string Name_Blida, Int32 Prica_Blide, Int32 ID_Postavhik)
        {
            commandConfig("Blida_IU");
            command.Parameters.AddWithValue("@Name_Blida", Name_Blida);
            command.Parameters.AddWithValue("@Prica_Blide", Prica_Blide);
            command.Parameters.AddWithValue("@ID_Postavhik", ID_Postavhik);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Blida_D(Int32 ID_Blida)
        {
            commandConfig("Blida_D");
            command.Parameters.AddWithValue("@ID_Blida", ID_Blida);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Chek_IU(Int32 ID_Chek, Int32 Number_of_Check, Int32 ID_Sotrudnika, Int32 ID_Zakaz)
        {
            commandConfig("Chek_IU");
            command.Parameters.AddWithValue("@ID_Chek", ID_Chek);
            command.Parameters.AddWithValue("@Number_of_Check", Number_of_Check);
            command.Parameters.AddWithValue("@ID_Sotrudnika", ID_Sotrudnika);
            command.Parameters.AddWithValue("@ID_Zakaz", ID_Zakaz);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Chek_IU(Int32 Number_of_Check, Int32 ID_Sotrudnika, Int32 ID_Zakaz)
        {
            commandConfig("Chek_IU");
            command.Parameters.AddWithValue("@Number_of_Check", Number_of_Check);
            command.Parameters.AddWithValue("@ID_Sotrudnika", ID_Sotrudnika);
            command.Parameters.AddWithValue("@ID_Zakaz", ID_Zakaz);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Chek_D(Int32 ID_Chek)
        {
            commandConfig("Chek_D");
            command.Parameters.AddWithValue("@ID_Chek", ID_Chek);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }


        public void Dolgnost_IU(Int32 ID_Dolgnost, string Name_Dolgnost, decimal Oklad_of_Dolgnost_Document, Int32 Otdel_ID)
        {
            commandConfig("Dolgnost_IU");
            command.Parameters.AddWithValue("@ID_Dolgnost", ID_Dolgnost);
            command.Parameters.AddWithValue("@Name_Dolgnost", Name_Dolgnost);
            command.Parameters.AddWithValue("@Oklad_of_Dolgnost_Document", Oklad_of_Dolgnost_Document);
            command.Parameters.AddWithValue("@Otdel_ID", Otdel_ID);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Dolgnost_IU(string Name_Dolgnost, decimal Oklad_of_Dolgnost_Document, Int32 Otdel_ID)
        {
            commandConfig("Dolgnost_IU");
            command.Parameters.AddWithValue("@Name_Dolgnost", Name_Dolgnost);
            command.Parameters.AddWithValue("@Oklad_of_Dolgnost_Document", Oklad_of_Dolgnost_Document);
            command.Parameters.AddWithValue("@Otdel_ID", Otdel_ID);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Dolgnost_D(Int32 ID_Dolgnost)
        {
            commandConfig("Dolgnost_D");
            command.Parameters.AddWithValue("@ID_Dolgnost", ID_Dolgnost);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Klinet_IU(Int32 ID_Klinet, string Familia_Klinet, string Name_Klinet, string Otchestvo_Klinet, string Nomet_Telefona)
        {
            commandConfig("Klinet_IU");
            command.Parameters.AddWithValue("@ID_Klinet", ID_Klinet);
            command.Parameters.AddWithValue("@Familia_Klinet", Familia_Klinet);
            command.Parameters.AddWithValue("@Name_Klinet", Name_Klinet);
            command.Parameters.AddWithValue("@Otchestvo_Klinet", Otchestvo_Klinet);
            command.Parameters.AddWithValue("@Nomet_Telefona", Nomet_Telefona);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Klinet_IU(string Familia_Klinet, string Name_Klinet, string Otchestvo_Klinet, string Nomet_Telefona)
        {
            commandConfig("Klinet_IU");
            command.Parameters.AddWithValue("@Familia_Klinet", Familia_Klinet);
            command.Parameters.AddWithValue("@Name_Klinet", Name_Klinet);
            command.Parameters.AddWithValue("@Otchestvo_Klinet", Otchestvo_Klinet);
            command.Parameters.AddWithValue("@Nomet_Telefona", Nomet_Telefona);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Klinet_D(Int32 ID_Klinet)
        {
            commandConfig("Klinet_D");
            command.Parameters.AddWithValue("@ID_Klinet", ID_Klinet);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Otdel_IU(Int32 ID_Otdel, string Name_Otdel)
        {
            commandConfig("Otdel_IU");
            command.Parameters.AddWithValue("@ID_Otdel", ID_Otdel);
            command.Parameters.AddWithValue("@Name_Otdel", Name_Otdel);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Otdel_IU(string Name_Otdel)
        {
            commandConfig("Otdel_IU");
            command.Parameters.AddWithValue("@Name_Otdel", Name_Otdel);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Otdel_D(Int32 ID_Otdel)
        {
            commandConfig("Otdel_D");
            command.Parameters.AddWithValue("@ID_Otdel", ID_Otdel);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Postavhik_IU(Int32 ID_Postavhik, string Familia_Postavhik, string Name_Postavhik, string Otchestvo_Postavik, string Seria_Document, string Nomer_Document)
        {
            commandConfig("Postavhik_IU");
            command.Parameters.AddWithValue("@ID_Postavhik", ID_Postavhik);
            command.Parameters.AddWithValue("@Familia_Postavhik", Familia_Postavhik);
            command.Parameters.AddWithValue("@Name_Postavhik", Name_Postavhik);
            command.Parameters.AddWithValue("@Otchestvo_Postavik", Otchestvo_Postavik);
            command.Parameters.AddWithValue("@Seria_Document", Seria_Document);
            command.Parameters.AddWithValue("@Nomer_Document", Nomer_Document);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Postavhik_IU(string Familia_Postavhik, string Name_Postavhik, string Otchestvo_Postavik, string Seria_Document, string Nomer_Document)
        {
            commandConfig("Postavhik_IU");
            command.Parameters.AddWithValue("@Familia_Postavhik", Familia_Postavhik);
            command.Parameters.AddWithValue("@Name_Postavhik", Name_Postavhik);
            command.Parameters.AddWithValue("@Otchestvo_Postavik", Otchestvo_Postavik);
            command.Parameters.AddWithValue("@Seria_Document", Seria_Document);
            command.Parameters.AddWithValue("@Nomer_Document", Nomer_Document);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Postavhik_D(Int32 ID_Postavhik)
        {
            commandConfig("Postavhik_D");
            command.Parameters.AddWithValue("@ID_Postavhik", ID_Postavhik);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Prikaz_o_Prieme_IU(Int32 ID_Prikaz_o_Prieme, Int32 ID_Dolgnost, Int32 ID_Soiskatel)
        {
            commandConfig("Prikaz_o_Prieme_IU");
            command.Parameters.AddWithValue("@ID_Prikaz_o_Prieme", ID_Prikaz_o_Prieme);
            command.Parameters.AddWithValue("@ID_Dolgnost", ID_Dolgnost);
            command.Parameters.AddWithValue("@ID_Soiskatel", ID_Soiskatel);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Prikaz_o_Prieme_IU(Int32 ID_Dolgnost, Int32 ID_Soiskatel)
        {
            commandConfig("Prikaz_o_Prieme_IU");
            command.Parameters.AddWithValue("@ID_Dolgnost", ID_Dolgnost);
            command.Parameters.AddWithValue("@ID_Soiskatel", ID_Soiskatel);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Prikaz_o_Prieme_D(Int32 ID_Prikaz_o_Prieme)
        {
            commandConfig("Prikaz_o_Prieme_D");
            command.Parameters.AddWithValue("@ID_Prikaz_o_Prieme", ID_Prikaz_o_Prieme);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }
        public void Prikaz_ob_Ovolen_IU(Int32 ID_Prikaz_ob_Ovolen, Int32 Nomer_Prikaz, string Prichina, Int32 ID_Sotrudnika)
        {
            commandConfig("Prikaz_ob_Ovolen_IU");
            command.Parameters.AddWithValue("@ID_Prikaz_ob_Ovolen", ID_Prikaz_ob_Ovolen);
            command.Parameters.AddWithValue("@Nomer_Prikaz", Nomer_Prikaz);
            command.Parameters.AddWithValue("@Prichina", Prichina);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Prikaz_ob_Ovolen_IU(Int32 Nomer_Prikaz, string Prichina, Int32 ID_Sotrudnika)
        {
            commandConfig("Prikaz_ob_Ovolen_IU");
            command.Parameters.AddWithValue("@Nomer_Prikaz", Nomer_Prikaz);
            command.Parameters.AddWithValue("@Prichina", Prichina);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Prikaz_ob_Ovolen_D(Int32 ID_Prikaz_ob_Ovolen)
        {
            commandConfig("Prikaz_ob_Ovolen_D");
            command.Parameters.AddWithValue("@ID_Prikaz_ob_Ovolen", ID_Prikaz_ob_Ovolen);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Rezume_IU(Int32 ID_Rezume, Int32 ID_Soiskatel, string Cel, string Obrazovanii, string Opit_Raboti, string Proff_Naviki)
        {
            commandConfig("Rezume_IU");
            command.Parameters.AddWithValue("@ID_Rezume", ID_Rezume);
            command.Parameters.AddWithValue("@ID_Soiskatel", ID_Soiskatel);
            command.Parameters.AddWithValue("@Cel", Cel);
            command.Parameters.AddWithValue("@Obrazovanii", Obrazovanii);
            command.Parameters.AddWithValue("@Opit_Raboti", Opit_Raboti);
            command.Parameters.AddWithValue("@Proff_Naviki", Proff_Naviki);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Rezume_IU(Int32 ID_Soiskatel, string Cel, string Obrazovanii, string Opit_Raboti, string Proff_Naviki)
        {
            commandConfig("Rezume_IU");
            command.Parameters.AddWithValue("@ID_Soiskatel", ID_Soiskatel);
            command.Parameters.AddWithValue("@Cel", Cel);
            command.Parameters.AddWithValue("@Obrazovanii", Obrazovanii);
            command.Parameters.AddWithValue("@Opit_Raboti", Opit_Raboti);
            command.Parameters.AddWithValue("@Proff_Naviki", Proff_Naviki);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Rezume_D(Int32 ID_Rezume)
        {
            commandConfig("Rezume_D");
            command.Parameters.AddWithValue("@ID_Rezume ", ID_Rezume);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Soiskatel_IU(Int32 ID_Soiskatel, string Familia_Soiskatel, string Name_Soiskatel, string Otchestvo_Soiskatel, string Seria_Document, string Nomer_Document, string Data_Rojdenia)
        {
            commandConfig("Soiskatel_IU");
            command.Parameters.AddWithValue("@ID_Soiskatel", ID_Soiskatel);
            command.Parameters.AddWithValue("@Familia_Soiskatel", Familia_Soiskatel);
            command.Parameters.AddWithValue("@Name_Soiskatel", Name_Soiskatel);
            command.Parameters.AddWithValue("@Otchestvo_Soiskatel", Otchestvo_Soiskatel);
            command.Parameters.AddWithValue("@Seria_Document", Seria_Document);
            command.Parameters.AddWithValue("@Nomer_Document", Nomer_Document);
            command.Parameters.AddWithValue("@Data_Rojdenia", Data_Rojdenia);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Soiskatel_IU(string Familia_Soiskatel, string Name_Soiskatel, string Otchestvo_Soiskatel, string Seria_Document, string Nomer_Document, string Data_Rojdenia)
        {
            commandConfig("Soiskatel_IU");
            command.Parameters.AddWithValue("@Familia_Soiskatel", Familia_Soiskatel);
            command.Parameters.AddWithValue("@Name_Soiskatel", Name_Soiskatel);
            command.Parameters.AddWithValue("@Otchestvo_Soiskatel", Otchestvo_Soiskatel);
            command.Parameters.AddWithValue("@Seria_Document", Seria_Document);
            command.Parameters.AddWithValue("@Nomer_Document", Nomer_Document);
            command.Parameters.AddWithValue("@Data_Rojdenia", Data_Rojdenia);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Soiskatel_D(Int32 ID_Soiskatel)
        {
            commandConfig("Soiskatel_D");
            command.Parameters.AddWithValue("@ID_Soiskatel ", ID_Soiskatel);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Zakaz_IU(Int32 ID_Zakaz, Int32 ID_Blida, Int32 ID_Klinet)
        {
            commandConfig("Zakaz_IU");
            command.Parameters.AddWithValue("@ID_Zakaz", ID_Zakaz);
            command.Parameters.AddWithValue("@ID_Blida", ID_Blida);
            command.Parameters.AddWithValue("@ID_Klinet", ID_Klinet);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Zakaz_IU(Int32 ID_Blida, Int32 ID_Klinet)
        {
            commandConfig("Zakaz_IU");
            command.Parameters.AddWithValue("@ID_Blida", ID_Blida);
            command.Parameters.AddWithValue("@ID_Klinet", ID_Klinet);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void Zakaz_D(Int32 ID_Zakaz)
        {
            commandConfig("Zakaz_D");
            command.Parameters.AddWithValue("@ID_Zakaz ", ID_Zakaz);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

    }
}
