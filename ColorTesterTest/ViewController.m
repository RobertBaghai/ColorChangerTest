//
//  ViewController.m
//  ColorTesterTest
//
//  Created by Robert Baghai on 11/20/15.
//  Copyright © 2015 Robert Baghai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    red_gradient = CAGradientLayer.layer;
    green_gradient = CAGradientLayer.layer;
    blue_gradient = CAGradientLayer.layer;
    alpha_gradient = CAGradientLayer.layer;
    
    CGRect rect            = self.sliderR.frame;
    rect.size.height       = 10;
    self.sliderR.frame     = rect;
    rect                   = self.sliderG.frame;
    rect.size.height       = 10;
    self.sliderG.frame     = rect;
    rect                   = self.sliderB.frame;
    rect.size.height       = 10;
    self.sliderB.frame     = rect;
    rect                   = self.sliderAlpha.frame;
    rect.size.height       = 10;
    self.sliderAlpha.frame = rect;
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [self addLayersToSliders];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)addLayersToSliders {
    UIColor *startColor     = [UIColor colorWithRed:0 green:self.sliderG.value blue:self.sliderB.value alpha:self.sliderAlpha.value];
    UIColor *endColor       = [UIColor colorWithRed:1 green:self.sliderG.value blue:self.sliderB.value alpha:self.sliderAlpha.value];
    red_gradient.frame      = self.sliderR.bounds;
    red_gradient.colors     = [NSArray arrayWithObjects:(id)[startColor CGColor], (id)[endColor CGColor], nil];
    red_gradient.startPoint = CGPointMake(0.0, 0.5);
    red_gradient.endPoint   = CGPointMake(1.0, 0.5);
    [self.sliderR.layer insertSublayer:red_gradient atIndex:2];
    
    startColor = [UIColor colorWithRed:self.sliderR.value green:0 blue:self.sliderB.value alpha:self.sliderAlpha.value];
    endColor   = [UIColor colorWithRed:self.sliderR.value green:1 blue:self.sliderB.value alpha:self.sliderAlpha.value];
    green_gradient.frame      = self.sliderG.bounds;
    green_gradient.colors     = [NSArray arrayWithObjects:(id)[startColor CGColor], (id)[endColor CGColor], nil];
    green_gradient.startPoint = CGPointMake(0.0, 0.5);
    green_gradient.endPoint   = CGPointMake(1.0, 0.5);
    [self.sliderG.layer insertSublayer:green_gradient atIndex:2];
    
    startColor = [UIColor colorWithRed:self.sliderR.value green:self.sliderG.value blue:0 alpha:self.sliderAlpha.value];
    endColor   = [UIColor colorWithRed:self.sliderR.value green:self.sliderG.value blue:1 alpha:self.sliderAlpha.value];
    blue_gradient.frame      = self.sliderB.bounds;
    blue_gradient.colors     = [NSArray arrayWithObjects:(id)[startColor CGColor], (id)[endColor CGColor], nil];
    blue_gradient.startPoint = CGPointMake(0.0, 0.5);
    blue_gradient.endPoint   = CGPointMake(1.0, 0.5);
    [self.sliderB.layer insertSublayer:blue_gradient atIndex:2];
    
    startColor = [UIColor colorWithRed:self.sliderR.value green:self.sliderG.value blue:self.sliderB.value alpha:0];
    endColor   = [UIColor colorWithRed:self.sliderR.value green:self.sliderG.value blue:self.sliderB.value alpha:1];
    alpha_gradient.frame      = self.sliderAlpha.bounds;
    alpha_gradient.colors     = [NSArray arrayWithObjects:(id)[startColor CGColor], (id) [endColor CGColor], nil];
    alpha_gradient.startPoint = CGPointMake(0.0, 0.5);
    alpha_gradient.endPoint   = CGPointMake(1.0, 0.5);
    [self.sliderAlpha.layer insertSublayer:alpha_gradient atIndex:2];
}

- (IBAction)sliderValue:(id)sender {
    [self addLayersToSliders];
    UIColor *newColor = [UIColor colorWithRed:self.sliderR.value green:self.sliderG.value blue:self.sliderB.value alpha:self.sliderAlpha.value];
    self.rectangularArea.backgroundColor = newColor;
    self.hexValue.text = [NSString stringWithFormat:@"%@",[self hexStringFromColor:newColor]];
}

- (NSString *)hexStringFromColor:(UIColor *)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"#%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255)];
}

@end
