openscad -D "$layer=\"pcb_stuff\"" -o bowtie_pcb_stuff.stl bowtie.scad
openscad -D "$layer=\"back_pcb\"" -o bowtie_back_pcb.stl bowtie.scad
openscad -D "$layer=\"frame\"" -o bowtie_frame.stl bowtie.scad
openscad -D "$layer=\"diffusor\"" -D "$dh=1" -o bowtie_diffusor_1.0mm.stl bowtie.scad
openscad -D "$layer=\"diffusor\"" -D "$dh=0.2" -o bowtie_diffusor_white_0.2mm.stl bowtie.scad
openscad -D "$layer=\"diffusor\"" -D "$dh=0.75" -o bowtie_diffusor_clear_0.75mm.stl bowtie.scad