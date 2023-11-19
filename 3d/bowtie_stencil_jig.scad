$fn=100;

// 2.8 x 3.2 x 1.8


// BowTie with LEDholes
/*
difference() {
    offset(r=-1) offset(r=2) bowtie(1.2);
    led_cutouts();
    mirror([1,0]) led_cutouts();
}
*/
// BowTie outline

difference() {
    translate([40,00,0.5]) cube([80,80,1],center=true);
    #linear_extrude(2) offset(r=-1) offset(r=2) bowtie(1.2);
    #translate([48.6,23.5,0])cylinder(r=2,h=10);
}






module bowtie(s=1) scale(s) {
    circle(r=10);
    translate([45,0]) intersection() {
        scale([2,1]) circle(r=20);
        translate([-50,0]) circle(r=50);
    }
    mirror([1,0])translate([45,0]) intersection() {
        scale([2,1]) circle(r=20);
        translate([-50,0]) circle(r=50);
    }    
}

module led_cutout() {
    square([3.6,3.0],center=true);
}

module led_cutouts() {
    led_cutout();
    for(i=[-20,0,20]) rotate(i) translate([45,0]) led_cutout();
    for(i=[-20,0,20]) rotate(i) translate([33,0]) led_cutout();
    for(i=[-20,20]) rotate(i) translate([21,0]) led_cutout();
}

module bowtie_outline(s=1) {
    difference() {
        offset(r=-1) offset(r=4) bowtie(s);
        difference() {
            bowtie(s);
            offset(r=3) circle(r=10*s);
        }
        offset(r=3) circle(r=7.5*s);
    }
}

module bowtie_outlineX(s=1) union() {
    difference() {
        offset(r=-1) offset(r=4) bowtie(s);
        offset(r=0) bowtie(s);
        //offset(r=-0.8) offset(r=2) bowtie(1.2);
    }
    difference() {
        offset(r=3) circle(r=10*s);
        offset(r=3) circle(r=7.5*s);
    }
}
