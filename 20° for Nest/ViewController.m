//
//  ViewController.m
//  20° for Nest
//
//  Created by Danny Ruchtie on 5/14/15.
//  Copyright (c) 2015 20°. All rights reserved.
//

#import "ViewController.h"
#import <pop/POP.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)popAnimations:(UIButton *)sender {
    POPDecayAnimation *anim =[POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anim.velocity = @(1000.);
    [sender.layer pop_addAnimation:anim forKey:@"slide"];

}

@end
