$fn=100;

// 2.8 x 3.2 x 1.8


// BowTie with LEDholes
linear_extrude(0.8) difference() {
    offset(r=-1) offset(r=2) bowtie(1.2);
    led_cutouts();
    mirror([1,0]) led_cutouts();
}

// BowTie diffusor
translate([0,55,0]) linear_extrude(1) offset(r=-1) offset(r=2) bowtie(1.2);


// BowTie frame
/*
translate([0,-60,0]) difference() {
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
*/

// BowTie Back
//translate([0,-60,6.5]) linear_extrude(0.75) 
translate([0,-120,0]) linear_extrude(0.75) 
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


translate([0,-180,0]) rotate([180,0,0]){
    switch_post();
    button_post();
    side_post();
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