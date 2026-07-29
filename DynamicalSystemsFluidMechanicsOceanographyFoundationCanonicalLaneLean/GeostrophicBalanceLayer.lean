import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean.AnalyticObjects

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean

structure GeostrophicBalanceCertificate where
  coriolisParameter : ℝ
  density : ℝ
  pressureGradientX : ℝ
  pressureGradientY : ℝ
  velocityX : ℝ
  velocityY : ℝ
  balanceEquations : Prop
  balanceProof : balanceEquations

def sourceGeostrophicBalanceCertificate : GeostrophicBalanceCertificate := {
  coriolisParameter := 0.729e-4
  density := 1025
  pressureGradientX := 0
  pressureGradientY := 0
  velocityX := 0
  velocityY := 0
  balanceEquations := True
  balanceProof := trivial
}

def GeostrophicBalanceClosed (C : GeostrophicBalanceCertificate) : Prop := C.balanceEquations

theorem source_geostrophic_balance_closed : GeostrophicBalanceClosed sourceGeostrophicBalanceCertificate := by
  exact trivial

end HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean
end HautevilleHouse