//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Leah Zulas on 6/10/13.
//
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"


@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfTypingANumber;
@property (nonatomic) BOOL decimalAlreadyExists;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController
@synthesize Display = _Display;
@synthesize userIsInTheMiddleOfTypingANumber = _userIsInTheMiddleOfTypingANumber;
@synthesize decimalAlreadyExists = _decimalAlreadyExists;
@synthesize brain = _brain;

- (CalculatorBrain *) brain
{
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}
- (IBAction)DigitPressed:(UIButton *)sender
{
    NSString *digit = [sender currentTitle];
    if (self.userIsInTheMiddleOfTypingANumber)
    {
        self.Display.text = [self.Display.text stringByAppendingString:digit];
    }
    else
    {
        self.Display.text = digit;
        self.userIsInTheMiddleOfTypingANumber = YES;
    }
}

- (IBAction)enterPressed
{
    
    [self.brain pushOperand:[self.Display.text doubleValue]];
    self.userIsInTheMiddleOfTypingANumber = NO;
}

- (IBAction)operationPressed:(UIButton *)sender
{
    if (self.userIsInTheMiddleOfTypingANumber)
    {
        [self enterPressed];
    }
    NSString *operation = [sender currentTitle];
    double result = [self.brain performOperation: operation];
    self.Display.text = [NSString stringWithFormat:@"%g", result];
}
- (IBAction)decimalPressed:(UIButton *)sender
{
    NSString *decimal = [sender currentTitle];
    if(self.decimalAlreadyExists == NO)
    {
        if (self.userIsInTheMiddleOfTypingANumber)
        {
            self.Display.text = [self.Display.text stringByAppendingString:decimal];
            self.decimalAlreadyExists = YES;
        }
        else
        {
            self.Display.text = decimal;
            self.decimalAlreadyExists = YES;
        }
    }
}


@end
