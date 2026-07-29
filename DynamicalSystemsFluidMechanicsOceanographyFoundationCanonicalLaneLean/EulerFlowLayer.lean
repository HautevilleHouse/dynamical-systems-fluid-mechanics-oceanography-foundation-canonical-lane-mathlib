import DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean.AnalyticObjects

/-!
# Euler Flow Layer

This module records the Euler flow envelope: inviscid, incompressible,
and vorticity conservation.
-/

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean

structure EulerFlowEnvelope where
  flow : FluidFlow
  inviscid : Prop
  incompressible : Prop
  vorticityConservation : Prop
  inviscidClosed : inviscid
  incompressibleClosed : incompressible
  vorticityConservationClosed : vorticityConservation

def sourceEulerFlowEnvelope : EulerFlowEnvelope := {
  flow := primitiveFlow
  inviscid := primitiveFlow.viscosity = 0
  incompressible := Incompressible primitiveFlow
  vorticityConservation := True
  inviscidClosed := by
    dsimp; native_decide
  incompressibleClosed := primitive_flow_incompressible
  vorticityConservationClosed := trivial
}

def EulerFlowEnvelopeClosed (E : EulerFlowEnvelope) : Prop :=
  E.inviscid ∧ E.incompressible ∧ E.vorticityConservation

theorem source_euler_flow_envelope_closed :
    EulerFlowEnvelopeClosed sourceEulerFlowEnvelope := by
  exact And.intro sourceEulerFlowEnvelope.inviscidClosed
    (And.intro sourceEulerFlowEnvelope.incompressibleClosed
      sourceEulerFlowEnvelope.vorticityConservationClosed)

end DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean
end HautevilleHouse