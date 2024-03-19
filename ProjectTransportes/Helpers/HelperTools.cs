﻿namespace ProjectTransportes.Helpers
{
    public class HelperTools
    {
        public static string GenerateSalt()
        {
            Random random = new Random();
            string salt = "";
            for(int i =1; i<=50; i++)
            {
                int aleatorio = random.Next(1, 255);
                char letra = Convert.ToChar(aleatorio);
                salt += letra;
            }
            return salt;
        }
        //Método que comparar si los password que le ponemos ambos son iguales 
        public static bool CompareArrays(byte[] a, byte[] b)
        {
            bool iguales = true;
            if(a.Length != b.Length) 
            { 
                iguales = false; 
            }
            else
            {
                for(int i=0; i<a.Length; i++)
                {
                    if (a[i].Equals(b[i])==false)
                    {
                        iguales = false;
                        break;
                    }
                }
            }
            return iguales;
        }
    }
}
