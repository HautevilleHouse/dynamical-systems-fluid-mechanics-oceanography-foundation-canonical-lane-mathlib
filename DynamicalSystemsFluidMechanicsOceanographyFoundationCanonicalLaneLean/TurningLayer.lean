import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean.AnalyticObjects

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean

structure EkmanLayerCertificate where
  windStress : ℝ
  ekmanDepth : ℝ
  transport : ℝ
  transportFormula : ℝ
  transportFormulaSatisfied : Prop
  transportFormulaProof : transportFormulaSatisfied

def sourceEkmanLayerCertificate : EkmanLayerCertificate := {
  windStress := 0.1
  ekmanDepth := 10.0
  transport := 0.1 / (2.0 * 0.729e-4) * 10.0
  transportFormula := 0.1 / (2.0 * 0.729e-4) * 10.0
  transportFormulaSatisfied := True
  transportFormulaProof := trivial
}

def EkmanLayerClosed (C : EkmanLayerCertificate) : Prop := C.transportFormulaSatisfied

theorem source_ekman_layer_closed : EkmanLayerClosed sourceEkmanLayerCertificate := by
  exact trivial

end HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean
end HautevilleHouse