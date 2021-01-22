function Add1DAtomicArray(numAtoms, VX0, InitDist, Temp,Type)
global C
global x  AtomSpacing
global nAtoms
global AtomType Vx Mass2 Mass1

if Type == 0
    Mass = Mass2;
else
    Mass = Mass1;
end

L = (numAtoms - 1) * AtomSpacing;

xp(1, :) = linspace(0, L, numAtoms);

for i=0:numAtoms-1
    x(nAtoms+i) = xp(i);
end
x(nAtoms + 1:nAtoms + numAtoms) = x(nAtoms + 1:nAtoms + numAtoms) + ...
    (rand(1, numAtoms) - 0.5) * AtomSpacing * InitDist + X0;
x
AtomType(nAtoms + 1:nAtoms + numAtoms) = Type;

if Temp == 0
    Vx(nAtoms + 1:nAtoms + numAtoms) = 0;
else
    std0 = sqrt(C.kb * Temp / Mass);
    Vx(nAtoms + 1:nAtoms + numAtoms) = std0 * randn(1, numAtoms);
end
Vx(nAtoms + 1:nAtoms + numAtoms) = Vx(nAtoms + 1:nAtoms + numAtoms) - ...
    mean(Vx(nAtoms + 1:nAtoms + numAtoms)) + VX0;

nAtoms = nAtoms + numAtoms;
end

