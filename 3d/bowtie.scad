$fn=100;

$layer = "";
$dh = 1;

// 2.8 x 3.2 x 1.8


// BowTie with LEDholes (for manual soldering)
if(!$layer || $layer=="led_frame") linear_extrude(0.8) difference() {
    offset(r=-1) offset(r=2) bowtie(1.2);
    led_cutouts();
    mirror([1,0]) led_cutouts();
}

// BowTie diffusor
if(!$layer || $layer=="diffusor") translate([0,55,0]) linear_extrude($dh) offset(r=-1) offset(r=2) bowtie(1.2);


// BowTie frame
if(!$layer || $layer=="frame") translate([0,-60,0]) difference() {
    $h = 9.5+0.7;
    union() {
        translate([0,0,0.6]) linear_extrude($h-0.6) bowtie_outline(1.2);
        translate([0,0,0.0]) linear_extrude(0.2) offset(r=-0.6) bowtie_outline(1.2);
        translate([0,0,0.2]) linear_extrude(0.2) offset(r=-0.4) bowtie_outline(1.2);
        translate([0,0,0.4]) linear_extrude(0.2) offset(r=-0.2) bowtie_outline(1.2);
    }
    translate([0,0,0.5]) linear_extrude($h) offset(r=-1) offset(r=2.2) bowtie(1.2);
    translate([0,0,$h-1-0.5]) linear_extrude(1) intersection() {
        offset(r=-1) offset(r=2.2+0.25) bowtie(1.2);
        union() {
            square([9,100],center=true);
            translate([+30,0]) square([9,100],center=true);
            translate([-30,0]) square([9,100],center=true);
            square([200,9],center=true);
        }
    }
}

// BowTie Back Prototype
if($layer=="back_proto") translate([0,-120,0]) linear_extrude(0.75) 
difference() {       
    union() {
        offset(r=-1) offset(r=2) bowtie(1.2);
        intersection() {
            offset(r=-1) offset(r=2.2+0.3) bowtie(1.2);
            union() {
                square([7,100],center=true);
                square([200,7],center=true);
                translate([-30,0]) square([7,100],center=true);
                translate([+30,0]) square([7,100],center=true);
            }
        }
    }
    intersection() {
        difference() {
            offset(r=-1) bowtie(1.2);
            offset(r=-2) bowtie(1.2);
        }
        union() {
            square([16,100],center=true);
            translate([+100+14,0,0]) square([200,16],center=true);
            translate([-100-14,0,0]) square([200,16],center=true);
            translate([+30,0]) square([16,100],center=true);
            translate([-30,0]) square([16,100],center=true);
        }
    }
    translate([+15,0]) square([1.5,18],center=true);
    translate([-15,0]) square([1.5,18],center=true);
    translate([45,19]) square([7,3],center=true);
    //translate([45,19]) square([9,8],center=true);
    translate([45,-18]) rotate(45) button_cutout();
}

// BowTie Back PCB
if(!$layer || $layer=="back_pcb") translate([0,-120,0]) { 
    linear_extrude(0.75) difference() {       
        union() {
            offset(r=-1) offset(r=2) bowtie(1.2);
            intersection() {
                offset(r=-1) offset(r=2.2+0.3) bowtie(1.2);
                union() {
                    square([6,100],center=true);
                    square([200,6],center=true);
                    translate([-30,0]) square([6,100],center=true);
                    translate([+30,0]) square([6,100],center=true);
                }
            }
        }
        intersection() {
            difference() {
                offset(r=-1) bowtie(1.2);
                offset(r=-2) bowtie(1.2);
            }
            union() {
                square([16,100],center=true);
                translate([+100+14,0,0]) square([200,18],center=true);
                translate([-100-14,0,0]) square([200,18],center=true);
                translate([+30,0]) square([17,100],center=true);
                translate([-30,0]) square([17,100],center=true);
            }
        }
        translate([+15,0]) square([1.5,18],center=true);
        translate([-15,0]) square([1.5,18],center=true);
        translate([-43.6,-20.2+1]) button_cutout();
        // Switch Cutout
        //translate([47.9,8.4]) rotate(10) square([9,5],center=true);
        translate([47.9-2.5,8.4]) rotate(10) hull() {
            translate([+1.25,0,0]) circle(r=1.5);
            translate([-1.25,0,0]) circle(r=1.5);
        }
    }
    // Button post
    translate([-43.6,-20.2]) cylinder(r=2,h=4.5,$fn=16);
}


if($layer=="proto_stuff") translate([0,-180,0]) rotate([180,0,0]){
    switch_post();
    button_post();
    side_post();
}

if(!$layer || $layer=="pcb_stuff") translate([0,-180,0]) {
    switch_know();
    side_post_pcb();
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


module button_cutout() {
    difference() {
        union() {
            circle(r=4);
            translate([0,5]) square([5,8],center=true);
        }
        circle(r=3.5);
        translate([0,5]) square([4,10],center=true);
    }
}



module switch_post() {
    $h = 8-1.8-3.4; // Elevation
    intersection() {
        difference() {
            linear_extrude($h) offset(r=-1) offset(r=2) bowtie(1.2);
            linear_extrude($h-1) offset(r=-1) bowtie(1.2);
            translate([45,19]) cube([4,0.5,20],center=true);
        }
        translate([48,26,0]) cylinder(r=10,h=10,$fn=32);
    }
}

module button_post() {
    $h = 8-1.8-2; // Elevation
    intersection() {
        difference() {
            linear_extrude($h) offset(r=-1) offset(r=2) bowtie(1.2);
            linear_extrude($h-1) offset(r=-1) bowtie(1.2);
            translate([45,-18]) cube([1,1,20],center=true);
        }
        translate([48,-26,0]) cylinder(r=10,h=10,$fn=32);
    }
}


module side_post() {
    $h = 8-1.8; // Elevation
    intersection() {
        difference() {
            linear_extrude($h) offset(r=-1) offset(r=2) bowtie(1.2);
            linear_extrude($h) offset(r=-1) bowtie(1.2);
        }
        translate([-50,0,0]) cube([15,50,20],center=true);
    }
}

module side_post_pcb() {
    $h = 8-2; // Elevation
    intersection() {
        difference() {
            linear_extrude($h) offset(r=-1) offset(r=2) bowtie(1.2);
            linear_extrude($h) offset(r=-0.5) bowtie(1.2);
        }
        translate([-50,0,0]) cube([15,50,20],center=true);
    }
}

module switch_know() {
    // 8.2mm for diffusor, pcb, space and bottom of lid
    // diff+pcb+switch: 5.6mm
    // 2.6mm below lid
    difference() {
        union() {
            translate([2.5,0,0])cylinder(r=1.3,h=2.6+0.75+0.3,$fn=32);
            translate([1,0,2/2])cube([7,4.5,2],center=true);
        }
        #cylinder(r=1,h=4,$fn=32);
        #translate([-2,0,2])cube([4,0.5,4],center=true);
    }
}