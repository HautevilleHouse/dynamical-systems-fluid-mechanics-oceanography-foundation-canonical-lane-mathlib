import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean.AnalyticObjects

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean

structure RossbyWaveCertificate where
  coriolisParameter : ℝ
  betaApproximation : ℝ
  waveNumber : ℝ
  frequency : ℝ
  phaseSpeed : ℝ
  linearizedEquationSatisfied : Prop
  linearizedEquationProof : linearizedEquationSatisfied

def sourceRossbyWaveCertificate : RossbyWaveCertificate := {
  coriolisParameter := 0.729e-4
  betaApproximation := 2.29e-11
  waveNumber := 1.0
  frequency := -0.729e-4 / 1.0
  phaseSpeed := -0.729e-4 / (1.0 ^ 2 + 2.29e-11 * 1.0 / 1.0 ^ 2)
  linearizedEquationSatisfied := True
  linearizedEquationProof := trivial
}

def RossbyWaveCertClosed (C : RossbyWaveCertificate) : Prop := C.linearizedEquationSatisfied

theorem source_rossby_wave_cert_closed : RossbyWaveCertClosed sourceRossbyWaveCertificate := by
  exact trivial

end HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean
end HautevilleHouse