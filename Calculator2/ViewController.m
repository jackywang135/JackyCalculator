//
//  ViewController.m
//  Calculator2
//
//  Created by JackyWang on 9/9/14.
//  Copyright (c) 2014 JackyWang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)NSString *strDisplay;

@end

@implementation ViewController


- (Calculator*)calculator
{
    if(!_calculator) _calculator=[[Calculator alloc]init];
    return _calculator;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.calculator.ifLastOperationWasEqual = NO;
}

- (BOOL)isDecimalInString
{
    return [self.strDisplay rangeOfString:@"."].location != NSNotFound;
}

- (IBAction)buttonDecimal:(UIButton *)sender
{
    if ([self.calculator ifLastOperationWasEqual]==YES) {
        [self.calculator clearMemory];
        self.strDisplay = @"0.";
        [self updateDisplay:self.strDisplay];
        [self printValues];
        return;
    }

    if (!self.strDisplay) {
        self.strDisplay = @"0.";
        [self updateDisplay:self.strDisplay];
        [self printValues];
        return;
    }

    if ([self isDecimalInString]) {
        return;
    }

    self.strDisplay = [self.strDisplay stringByAppendingString:@"."];
    [self updateDisplay:self.strDisplay];
    [self printValues];
}

- (IBAction)buttonNum:(UIButton*)sender
{
    NSString *newDigit = sender.currentTitle;
    if (self.calculator.ifLastOperationWasEqual==YES) {
        [self.calculator clearMemory];
        self.strDisplay = newDigit;
        [self updateDisplay:self.strDisplay];
        return;
    }

    if ([self.strDisplay isEqualToString:@"0"]) {
        if([newDigit isEqualToString:@"0"]) {
            return;
        }
    }
    
    self.strDisplay = self.strDisplay != nil ? [self.strDisplay stringByAppendingString:newDigit] : newDigit;
    [self updateDisplay:self.strDisplay];
    [self printValues];
}

- (IBAction)buttonOperator:(UIButton*)sender
{
    if (!self.calculator.num) {
        self.calculator.num=[[NSDecimalNumber alloc]initWithString:self.strDisplay];
        self.calculator.operator=sender.currentTitle;
        self.strDisplay=nil;
        [self printValues];
        return;
    }

    if (self.calculator.ifLastOperationWasEqual==YES) {
        self.calculator.operator=sender.currentTitle;
        self.calculator.ifLastOperationWasEqual=NO;
        self.strDisplay=nil;
        [self printValues];
        return;
    }

    if (self.strDisplay!=nil) {
        self.calculator.num=[self.calculator calculate:[[NSDecimalNumber alloc]initWithString:self.strDisplay]];
        [self updateDisplay:[NSString stringWithFormat:@"%@",self.calculator.num]];
        self.calculator.operator=sender.currentTitle;
        self.strDisplay=nil;
        [self printValues];
        return;
    }

    self.calculator.operator=sender.currentTitle;

    [self printValues];
}


-(IBAction)buttonEqual:(UIButton*)sender
{
    if(self.calculator.num!=nil && self.calculator.operator!=nil && self.strDisplay!=nil)
    {
        self.calculator.num=[self.calculator calculate:[[NSDecimalNumber alloc]initWithString:self.strDisplay]];
        [self updateDisplay:[NSString stringWithFormat:@"%@",self.calculator.num]];
        self.calculator.ifLastOperationWasEqual=YES;
    }
    [self printValues];
}

-(IBAction)buttonClear:(UIButton*)sender
{
    [self.calculator clearMemory];
    self.strDisplay=@"";
    [self updateDisplay:self.strDisplay];
    [self printValues];
}

-(IBAction)buttonInvert:(UIButton*)sender
{
    if([self.calculator ifLastOperationWasEqual]==YES)
    {
        self.strDisplay=[NSString stringWithFormat:@"%@",self.calculator.num];
    }
    NSDecimalNumber *NegOne=[[NSDecimalNumber alloc]initWithString:@"-1"];
    self.
    
    
    self.strDisplay=[NSString stringWithFormat:@"%f",[self.strDisplay doubleValue]*(-1)];
    [self updateDisplay:self.strDisplay];
    [self printValues];
    
}

-(IBAction)buttonPercent:(UIButton*)sender
{
    
}


-(void)updateDisplay:(NSString*)string
{
    self.labelDisplay.attributedText=[self convertStringToAttributed:string];
    self.labelDisplay.numberOfLines=1;
    self.labelDisplay.adjustsFontSizeToFitWidth=YES;
}

-(NSAttributedString*)convertStringToAttributed:(NSString*)string
{
    return [[NSAttributedString alloc]initWithString:string attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:200]}];
}


-(void)printValues
{
    NSLog(@"self.calculator.num:%@",self.calculator.num);
    NSLog(@"self.calculator.operator:%@",self.calculator.operator);
    NSLog(@"self.calculator.ifLastOperationWasEqual:%i",self.calculator.ifLastOperationWasEqual);
    NSLog(@"strDisplay:%@",self.strDisplay);
}


@end
