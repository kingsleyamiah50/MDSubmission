%The code below is modified to Stream atoms from four sides of the Plot
function [output_args] = AddParticleStream(num1, num2, num3, num4, Type, Ep, Seper)
global AtomSpacing x y AtomType Vx Vy Mass2 Mass1 nAtoms

if Type == 0
    Mass = Mass2;
else
    Mass = Mass1;
end

for p = 0:num1 - 1
    nAtoms = nAtoms + 1;
    x(nAtoms) = -10 * AtomSpacing - Seper * p * AtomSpacing * sin(pi/2);
    y(nAtoms) = 0 * AtomSpacing - Seper * p * AtomSpacing * cos(pi/2);
    AtomType(nAtoms) = Type;
end
for p = 0:num2 - 1
    nAtoms = nAtoms + 1;
    x(nAtoms) = 10 * AtomSpacing - Seper * p * AtomSpacing * sin(-pi/2);
    y(nAtoms) = 0 * AtomSpacing - Seper * p * AtomSpacing * cos(-pi/2);
    AtomType(nAtoms) = Type;
end
for p = 0:num3 - 1
    nAtoms = nAtoms + 1;
    x(nAtoms) = 0.1 * AtomSpacing - Seper * p * AtomSpacing * sin(-pi);
    y(nAtoms) = 10 * AtomSpacing - Seper * p * AtomSpacing * cos(-pi);
    AtomType(nAtoms) = Type;
end
for p = 0:num4 - 1
    nAtoms = nAtoms + 1;
    x(nAtoms) = 0.1 * AtomSpacing - Seper * p * AtomSpacing * sin(pi);
    y(nAtoms) = -10 * AtomSpacing - Seper * p * AtomSpacing * - cos(pi);
    AtomType(nAtoms) = Type;
end
V = 3 * sqrt(2 * Ep / Mass);


for p = 1:num1
    Vx(nAtoms - (num1 + num2 + num3 + num4) + p) = V  * sin(pi/2);
    Vy(nAtoms - (num1 + num2 + num3 + num4) + p) = V  * cos(pi/2);
end

for p = 1:num2
    Vx(nAtoms - (num2 + num3 + num4) + p) = V  * sin(-pi/2);
    Vy(nAtoms - (num2 + num3 + num4) + p) = V  * cos(-pi/2);
end

for p = 1:num3
    Vx(nAtoms - (num3 + num4) + p) = V  * sin(-pi);
    Vy(nAtoms - (num3 + num4) + p) = V  * cos(-pi);
end

for p = 1:num4
    Vx(nAtoms - (num4) + p) = V  * sin(pi);
    Vy(nAtoms - (num4) + p) = - V  * cos(pi);
end
end
