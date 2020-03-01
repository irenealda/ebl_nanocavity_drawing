# ebl_nanocavity_drawing
Matlab code to draw a 1D photonic crystal cavity on a waveguide and convert it to an .asc file

It must be executed in the following order:
1. Draw grating couplers and waveguide: draw_waveguide_and_couplers.m
2. Draw 1D Photonic crystal cavity. It contains the code for both the dielectric mode design and the air mode design: rectangles_dielectric.m or rectangles_air.m
3. Convert drawing into .asc file: convert_to_asc_file.m
