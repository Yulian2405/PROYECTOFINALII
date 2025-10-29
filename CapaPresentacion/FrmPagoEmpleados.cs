using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaDatos;
using ComponentFactory.Krypton.Toolkit;

namespace CapaPresentacion
{
    public partial class FrmPagoEmpleados : KryptonForm
    {
        CD_PagoEmpleados cd_PagoEmpleados = new CD_PagoEmpleados();

        public FrmPagoEmpleados()
        {
            InitializeComponent();
        }

        private void FrmPagoEmpleados_Load(object sender, EventArgs e)
        {
            MtdConsultarPagoEmpleados();
        }

        private void MtdConsultarPagoEmpleados()
        {
            DataTable DtpagoEmpleados = cd_PagoEmpleados.MtdConsultarPagoEmpleados();
            dgvPagoEmpleados.DataSource = DtpagoEmpleados;
        }

        private void btnAgregarPE_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(txtCodigoE.Text) ||
                string.IsNullOrEmpty(txtHorasE.Text) ||
                string.IsNullOrEmpty(txtSalarioBase.Text) ||
                string.IsNullOrEmpty(txtTotalPago.Text) ||
                string.IsNullOrEmpty(dtpFecha.Text) ||
                string.IsNullOrEmpty(cboxMetodoPago.Text) ||
                string.IsNullOrEmpty(cboxEstadoE.Text))
            {
                MessageBox.Show("Favor completar formulario", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                int CodigoEmpleado = int.Parse(txtCodigoE.Text);
                DateTime Fecha = dtpFecha.CalendarTodayDate;
                decimal HorasExtra = decimal.Parse(txtHorasE.Text);
                decimal TotalPago = decimal.Parse(txtTotalPago.Text);
                decimal SalarioBase = decimal.Parse(txtSalarioBase.Text);
                string MetodoPago = cboxMetodoPago.Text;
                string Estado = cboxEstadoE.Text;

                try
                {
                    cd_PagoEmpleados.MtdAgregarpagoEmpleados(CodigoEmpleado, Fecha, HorasExtra, TotalPago,  SalarioBase, MetodoPago, Estado);
                    MessageBox.Show("Datos agregados correctamente", "Correcto", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    MtdConsultarPagoEmpleados();

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
    }
}
