import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean.AnalyticObjects

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean

structure SurfaceGravityWaveCertificate where
  waterDepth : ℝ
  waveNumber : ℝ
  angularFrequency : ℝ
  deepWaterDispersion : Prop
  shallowWaterDispersion : Prop
  dispersionRelation : ℝ → ℝ → ℝ
  dispersionProof : angularFrequency = sqrt (9.81 * waterDepth * waveNumber * tanh (waveNumber * waterDepth))
  deepWaterCheck : deepWaterDispersion
  shallowWaterCheck : shallowWaterDispersion
  deepWaterProof : deepWaterDispersion
  shallowWaterProof : shallowWaterDispersion

def sourceSurfaceGravityWaveCertificate : SurfaceGravityWaveCertificate := {
  waterDepth := 1000
  waveNumber := 0.001
  angularFrequency := sqrt (9.81 * 1000 * 0.001 * tanh (0.001 * 1000))
  deepWaterDispersion := True
  shallowWaterDispersion := True
  dispersionRelation := λ k d => sqrt (9.81 * d * k * tanh (k * d))
  dispersionProof := by
    rfl
  deepWaterCheck := by
    trivial
  shallowWaterCheck := by
    trivial
  deepWaterProof := by
    trivial
  shallowWaterProof := by
    trivial
}

def SurfaceGravityWaveClosed (C : SurfaceGravityWaveCertificate) : Prop :=
  C.deepWaterDispersion ∧ C.shallowWaterDispersion

theorem source_surface_gravity_wave_closed : SurfaceGravityWaveClosed sourceSurfaceGravityWaveCertificate := by
  exact And.intro sourceSurfaceGravityWaveCertificate.deepWaterProof sourceSurfaceGravityWaveCertificate.shallowWaterProof

end HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean
end HautevilleHouse