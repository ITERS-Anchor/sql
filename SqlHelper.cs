using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace t1_UserLogin
{
    public static partial class SqlHelper
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["dbtest"].ConnectionString;

        //执行查询：select返回多行多列
        public static SqlDataReader ExecuteReader(string sql, params SqlParameter[] ps)//SqlParameter[] ps=new SqlParameter[];
        {
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (ps.Length > 0)
            {
                cmd.Parameters.AddRange(ps);
            }

            conn.Open();
            //使用SqlDataReader时，连接必须是打开的；设置此参数后，关闭SqlDataReader时会自动关闭使用的连接
            return cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }

        //执行查询：select返回首行首列
        public static object ExecuteScalar(string sql, params SqlParameter[] ps)
        {
            using (SqlConnection conn=new SqlConnection(connStr))
            {
                SqlCommand cmd=new SqlCommand(sql,conn);
                cmd.Parameters.AddRange(ps);

                conn.Open();
                return cmd.ExecuteScalar();
            }
        }


        //执行操作：insert,update,delete
        public static int ExecuteNonQuery(string sql,params SqlParameter[] ps)
        {
            using (SqlConnection conn=new SqlConnection(connStr))
            {
                SqlCommand cmd=new SqlCommand(sql,conn);
                cmd.Parameters.AddRange(ps);

                conn.Open();
                return cmd.ExecuteNonQuery();
            }
        }

    }
}
