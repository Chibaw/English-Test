//
//  Phase1ViewController.m
//  AnglaisTest1
//
//  Created by Julien Bordellier on 23/07/12.
//  Copyright (c) 2012 Epitech. All rights reserved.
//

#import "QuestionsAnswersInfoViewController.h"

@interface QuestionsAnswersInfoViewController ()

@end

@implementation QuestionsAnswersInfoViewController
@synthesize validationChecker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setValidationChecker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)nextQuestions:(id)sender {
    if (self.validationChecker.on == TRUE){
        [self performSegueWithIdentifier:@"QuestionsAnswers" sender:self];    
    }
}

@end
