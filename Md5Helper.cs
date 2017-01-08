using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace t1_UserLogin
{
    public static partial class Md5Helper
    {
        public static string Encrypt(string pwd)
        {
            MD5 md5 = MD5.Create();

            //将字符串转换成字符数据：指定编码
            byte[] pwd2 = Encoding.UTF8.GetBytes(pwd);

            byte[] pwd3 = md5.ComputeHash(pwd2);

            StringBuilder sb=new StringBuilder("");
            for (int i = 0; i < pwd3.Length; i++)
            {
                sb.Append(pwd3[i].ToString("x2").ToLower());
            }
            //0-255
            //00-ff 10=>16  07
            return sb.ToString();
        }
    }
}
