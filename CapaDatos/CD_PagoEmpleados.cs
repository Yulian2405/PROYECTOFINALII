using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CD_PagoEmpleados
    {
        Conexion Conexion = new Conexion();
        public DataTable MtdConsultarPagoEmpleados()
        {
            string QueryConsultar = "Select * from tbl_pagoEmpleados";
            SqlDataAdapter SqlAdap = new SqlDataAdapter(QueryConsultar, Conexion.MtdAbrirConexion());
            DataTable Dt = new DataTable();
            SqlAdap.Fill(Dt);
            Conexion.MtdCerrarConexion();
            return Dt;
        }

        public void MtdAgregarpagoEmpleados(int CodigoEmpleado, decimal HorasExtras, DateTime Fecha, decimal SalarioBase, decimal TotalPago, string MetodoPago, string Estado)
        {
            string QueryAgregar = "Insert into tbl_pagoEmpleados (CodigoEmpleado, Dpi, Direccion, FechaIngreso, SalarioBase, TipoEmpleado, Estado) values (@Nombre, @Dpi, @Direccion, @FechaIngreso,@SalarioBase, @TipoEmpleado, @Estado)";
            SqlCommand cmd = new SqlCommand(QueryAgregar, Conexion.MtdAbrirConexion());
            cmd.Parameters.AddWithValue("@CodigoEmpleado", CodigoEmpleado);
            cmd.Parameters.AddWithValue("@Fecha", Fecha);
            cmd.Parameters.AddWithValue("@HorasExtras", HorasExtras);
            cmd.Parameters.AddWithValue("@SalarioBase", SalarioBase);
            cmd.Parameters.AddWithValue("@TotalPago", TotalPago);
            cmd.Parameters.AddWithValue("@MetodoPago", MetodoPago);
            cmd.Parameters.AddWithValue("@Estado", Estado);
            cmd.ExecuteNonQuery();
            Conexion.MtdCerrarConexion();
        }

        public void MtdActualizarpagoEmpleados(int CodigoEmpleado, DateTime Fecha, decimal HorasExtras, decimal SalarioBase, decimal TotalPago, string MetodoPago, string Estado)
        {
            string QueryActualizarpagoEmpleados = "Update tbl_pagoEmpleados set CodigoEmpleado=@CodigoEmpleado, Fecha=@Fecha, HorasExtras=@HorasExtras, SalarioBase=@SalarioBase, TotalPago=@TotalPago, MetodoPago=@MetodoPago Estado=@Estado where CodigoPagoEmp=@CodigoPagoEmp";
            SqlCommand cmd = new SqlCommand(QueryActualizarpagoEmpleados, Conexion.MtdAbrirConexion());
            cmd.Parameters.AddWithValue("@CodigoEmpleado", CodigoEmpleado);
            cmd.Parameters.AddWithValue("@Fecha", Fecha);
            cmd.Parameters.AddWithValue("@HorasExtras", HorasExtras);
            cmd.Parameters.AddWithValue("@SalarioBase", SalarioBase);
            cmd.Parameters.AddWithValue("@TotalPago", TotalPago);
            cmd.Parameters.AddWithValue("@MetodoPago", MetodoPago);
            cmd.Parameters.AddWithValue("@Estado", Estado);
            cmd.ExecuteNonQuery();
            Conexion.MtdCerrarConexion();
        }


        public void MtdEliminarEmpleado(int CodigoPagoEmp)
        {
            string QueryEliminarEmpleado = "Delete tbl_pagoEmpleados where CodigoPagoEmp=@CodigoPagoEmp";
            SqlCommand cmd = new SqlCommand(QueryEliminarEmpleado, Conexion.MtdAbrirConexion());
            cmd.Parameters.AddWithValue("@CodigoPagoEmp", CodigoPagoEmp);
            cmd.ExecuteNonQuery();
            Conexion.MtdCerrarConexion();
        }
    }

}
