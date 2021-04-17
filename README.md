### Columbia University in the City of New York
### The Fu Foundation School of Engineering and Applied Science
### Digital Manufacturing

# Tealight Holder using OpenSCAD

## Executive Summary

The goal of this project was to perform generative design for 3D printing. I designed and 3D printed a lamp shade made entirely of a lattice design. I wrote a program that generated the lamp shade’s geometry procedurally and accommodated three LED tea-lights. The software used was OpenSCAD, which allowed me to output my file in STL format. This file could then be imported into a 3D printer slicer software in order to be 3D printed.

Some of the constraints of this assignment were that our design had to have a print time less than 12 hours and cost less than $100 on Shapeways.com. The design also had to sit stably on a flat surface and fit a tea-light that was provided by the university.

## Software Description

The code starts by generating the base (cylinder of tealight diameter + thickness of print) and flower around it. The flower is composed of rotated cylinders, and penetrates through the base when rotated. The code then hollows out the inside of the base to fit the tea-light (difference in tealight diameter) and clears any material below the zero level to ensure the base sits steadily.

The code then generates a support design for the higher layer by extruding a rotated circle to give it an encapsulating design. The space between the two layers is equal to the height of the tea-light to allow the user to place and remove the tea-light with ease.

The steps are then repeated to produce another layer of the hollowed base but no flower as it did not look visually appealing to have too many designs on the middle layer. Next, supports are generated again to interface with the top layer (but this time rotated 180 degrees). For the top layer, the base is created again and hollowed out. Finally, another flower is created, but this time it is placed at an angle where supports are not required when printing on the 3D printer.

To add more complexity, the flower petals were made curvy using a linear extrusion with a twist and the supports between the layers were made to buldge out more (to allow for more number of cylinders to fit in the same space).
