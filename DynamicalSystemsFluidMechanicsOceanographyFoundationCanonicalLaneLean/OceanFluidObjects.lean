import DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean.MathlibStatement
import Mathlib.Data.Real.Basic

/-!
# Ocean Fluid Analytic Objects

This module defines the analytic objects for the ocean fluid dynamics domain:
bathymetry, velocity fields, density stratification, Coriolis parameter,
and primitive equations for ocean dynamics.
-/

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3
abbrev Bathymetry := Space3 → ℝ
abbrev CoriolisParam := Space3 → ℝ

structure OceanPrimitiveOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  transport : VectorField → VectorField
  coriolisForce : VectorField → VectorField
  buoyancyForce : VectorField → ScalarField
  pressureProjection : VectorField → VectorField
  pressureProjectionIdempotent : ∀ u, pressureProjection (pressureProjection u) = pressureProjection u

structure OceanFlow where
  velocity : VectorField
  pressure : ScalarField
  density : ScalarField
  bathymetry : Bathymetry
  coriolis : CoriolisParam
  viscosity : ℝ
  operators : OceanPrimitiveOperators

structure OceanStratification where
  referenceDensity : ℝ
  buoyancyFrequency : ℝ
  mixedLayerDepth : ℝ

def zeroScalarField : ScalarField := fun _ _ => 0
def zeroVectorField : VectorField := fun _ _ _ => 0

noncomputable def primitiveOperators : OceanPrimitiveOperators := {
  divergence := fun _ => zeroScalarField
  gradient := fun _ => zeroVectorField
  laplacian := fun u => u
  timeDerivative := fun _ => zeroVectorField
  transport := fun _ => zeroVectorField
  coriolisForce := fun u => u
  buoyancyForce := fun _ => zeroScalarField
  pressureProjection := fun u => u
  pressureProjectionIdempotent := by intro u; rfl
}

def primitiveFlow : OceanFlow := {
  velocity := zeroVectorField
  pressure := zeroScalarField
  density := zeroScalarField
  bathymetry := fun _ => 0
  coriolis := fun _ => 0
  viscosity := 1
  operators := primitiveOperators
}

def Incompressible (F : OceanFlow) : Prop :=
  F.operators.divergence F.velocity = zeroScalarField

def HydrostaticBalance (F : OceanFlow) : Prop :=
  F.operators.buoyancyForce F.velocity = zeroScalarField

def CoriolisBalanced (F : OceanFlow) : Prop :=
  F.operators.coriolisForce F.velocity = zeroVectorField

def OceanEquationClosed (F : OceanFlow) : Prop :=
  Incompressible F ∧ HydrostaticBalance F ∧ CoriolisBalanced F

end DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean
end HautevilleHouse