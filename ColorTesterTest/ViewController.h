//
//  ViewController.h
//  ColorTesterTest
//
//  Created by Robert Baghai on 11/20/15.
//  Copyright © 2015 Robert Baghai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController
{
    CAGradientLayer *red_gradient;
    CAGradientLayer *green_gradient;
    CAGradientLayer *blue_gradient;
    CAGradientLayer *alpha_gradient;
}
@property (weak, nonatomic) IBOutlet UILabel *hexValue;
@property (weak, nonatomic) IBOutlet UISlider *sliderR;
@property (weak, nonatomic) IBOutlet UISlider *sliderG;
@property (weak, nonatomic) IBOutlet UISlider *sliderB;
@property (weak, nonatomic) IBOutlet UISlider *sliderAlpha;
@property (weak, nonatomic) IBOutlet UIView *rectangularArea;
- (IBAction)sliderValue:(UISlider*)sender;

@end

