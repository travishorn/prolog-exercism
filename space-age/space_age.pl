% Given a planet and an age in Earth-seconds, calculate how old someone would be
% on the planet.

% A collection of facts which relate a planet to it's orbital period (how often
% it revolves around the sun) as a ratio to Earth's orbital period.
orbital_period("Mercury", 0.2408467).
orbital_period("Venus", 0.61519726).
orbital_period("Earth", 1.0).
orbital_period("Mars", 1.8808158).
orbital_period("Jupiter", 11.862615).
orbital_period("Saturn", 29.447498).
orbital_period("Uranus", 84.016846).
orbital_period("Neptune", 164.79132).

space_age(Planet, AgeSec, Years) :-

  % Bind `OrbitalPeriod` to the orbital period of the given `Planet`
  orbital_period(Planet, OrbitalPeriod),

  % Bind `Years` to the given age (in seconds) divided by the product of the
  % orbital period and the number of Earth seconds in one year. The result is
  % the age on the given planet.
  Years is AgeSec / (OrbitalPeriod * 31557600).
