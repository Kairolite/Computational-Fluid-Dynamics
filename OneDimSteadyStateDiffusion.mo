model OneDimSteadyStateDiffusion

  type Temperature = Real(unit="K", min=0);
  type ConductionCoefficient = Real (unit="W.m-1.K-1", min=0);
  type Area = Real(unit="m2");
  type Length = Real(unit="m", min=0);
  
  parameter Integer n = 10;
  parameter Length L = 0.5;
  parameter Length dx = L/n;
  parameter ConductionCoefficient k = 1000;
  parameter Area A = 0.01;
  
  Temperature T[n+2];
  
equation

T[1] = 100;
T[end] = 500;

// T[2]

(3*k/dx)*A*T[2] = (2*k/dx)*A*T[1] + (k/dx)*A*T[3];

// T[3:n]

for i in 3:n loop
  2*(k/dx)*A*T[i] = (k/dx)*A*T[i-1] + (k/dx)*A*T[i+1];
end for;

// T[n+1]

(3*k/dx)*A*T[end-1] = (k/dx)*A*T[end-2] + (2*k/dx)*A*T[end];

end OneDimSteadyStateDiffusion;
