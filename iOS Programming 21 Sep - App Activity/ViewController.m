//
//  ViewController.m
//  iOS Programming 21 Sep - App Activity
//
//  Created by Jeremia Muhia on 9/21/16.
//  Copyright © 2016 Jeremia Muhia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray * colorArray;

@property (weak, nonatomic) IBOutlet UISlider *sliderPos;

@property (weak, nonatomic) IBOutlet UITextField *alphaSlider;

@property (weak, nonatomic) IBOutlet UILabel *colorName;

@end

@implementation ViewController

- (IBAction)colorChosen:(id)sender {
    
    self.alphaSlider.text = @"255";
    [self.sliderPos setValue:255 animated:YES];
    
    // every button should invoke this method
    NSString * myColor = [sender titleForState: UIControlStateNormal];
    
    if ([myColor isEqualToString:@"Red"]) {
        self.colorName.text = [self.colorArray objectAtIndex:1];
        self.colorName.backgroundColor = [UIColor redColor];
        self.colorName.textColor = [UIColor cyanColor];
    }
    else if ([myColor isEqualToString:@"Green"]) {
        self.colorName.text = [self.colorArray objectAtIndex:3];
        self.colorName.backgroundColor = [UIColor greenColor];
        self.colorName.textColor = [UIColor redColor];
    }
    else if ([myColor isEqualToString:@"Blue"]) {
        self.colorName.text = [self.colorArray objectAtIndex:3];
        self.colorName.backgroundColor = [UIColor blueColor];
        self.colorName.textColor = [UIColor redColor];
    }
    
} // end colorChosen

- (IBAction)sliderMoved:(id)sender {
    UISlider * mySlider = (UISlider *) sender;
    
    int numToDisplay = (int) mySlider.value;
    
    NSString * displayNum = [[NSString alloc] initWithFormat:@"%d", numToDisplay];
    
    self.alphaSlider.text = displayNum;
    
    self.colorName.backgroundColor = [self.colorName.backgroundColor colorWithAlphaComponent:(numToDisplay / 255.0)];

} // end sliderMoved

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray * myColorArray = [[NSArray alloc] initWithObjects:@"Welcome to NYU", @"Welcome (in red)", @"Welcome (in green)", @"Welcome (in blue)", nil];
    
    self.colorName.text = [myColorArray objectAtIndex:0];
    self.colorArray = myColorArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
