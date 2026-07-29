import DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end DynamicalSystemsFluidMechanicsOceanographyFoundationCanonicalLaneLean
end HautevilleHouse