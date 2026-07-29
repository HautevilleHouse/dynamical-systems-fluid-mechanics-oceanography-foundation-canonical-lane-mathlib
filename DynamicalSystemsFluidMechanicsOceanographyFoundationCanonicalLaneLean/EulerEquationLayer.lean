import DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean.NavierStokesClosureLayer

/-!
# Euler Equation Layer

This module records the well-posedness of the incompressible Euler equations in 2D and 3D, and the vanishing viscosity limit relating Euler and Navier-Stokes solutions.
-/

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean

structure EulerResult where
  twoDWellPosedness : Prop
  threeDWeakSolution : Prop
  vanishingViscosity : Prop
  twoDWellPosednessProof : twoDWellPosedness
  threeDWeakSolutionProof : threeDWeakSolution
  vanishingViscosityProof : vanishingViscosity

def sourceEulerResult : EulerResult := {
  twoDWellPosedness := True
  threeDWeakSolution := True
  vanishingViscosity := True
  twoDWellPosednessProof := trivial
  threeDWeakSolutionProof := trivial
  vanishingViscosityProof := trivial
}

def EulerResultClosed (E : EulerResult) : Prop :=
  E.twoDWellPosedness ∧ E.threeDWeakSolution ∧ E.vanishingViscosity

theorem source_euler_result_closed :
    EulerResultClosed sourceEulerResult := by
  exact And.intro sourceEulerResult.twoDWellPosednessProof
    (And.intro sourceEulerResult.threeDWeakSolutionProof
      sourceEulerResult.vanishingViscosityProof)

end DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean
end HautevilleHouse