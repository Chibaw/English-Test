//
//  Phase1ViewController.m
//  AnglaisTest1
//
//  Created by Julien Bordellier on 23/07/12.
//  Copyright (c) 2012 Epitech. All rights reserved.
//

#import "QuestionsAnswersInfoViewController.h"
#import "ImageSoundViewController.h"
#import "QuestionsAnswersViewController.h"
#import "EmptyQuestionViewController.h"

@interface QuestionsAnswersInfoViewController ()

@end

@implementation QuestionsAnswersInfoViewController
@synthesize validationChecker;
@synthesize infoSection;
@synthesize dic;
@synthesize section;
@synthesize answers;

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
    if (dic) {
    NSArray *sectionsArray = [[NSArray alloc] initWithArray:[dic objectForKey:@"QuestionsAndAnswers"]];
    [infoSection setText:[[[sectionsArray objectAtIndex:section] objectAtIndex:0] objectForKey:@"question"]];
    // Do any additional setup after loading the view.
    }
}

- (void)viewDidUnload
{
    [self setValidationChecker:nil];
    [self setInfoSection:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toSectionOne"])
    {
        ImageSoundViewController *vc = [segue destinationViewController];
        [vc setSection:[[NSArray alloc] initWithArray:[dic objectForKey:@"QuestionsAndAnswers"]]];
        [vc setSectionNum:section];
        [vc setDic:dic];
        [vc setAnswers:[[NSMutableString alloc] initWithString:@""]];
    } else if ([[segue identifier] isEqualToString:@"toSectionTwo"]) {
        QuestionsAnswersViewController *vc = [segue destinationViewController];
        [vc setSection:[[NSArray alloc] initWithArray:[dic objectForKey:@"QuestionsAndAnswers"]]];
        [vc setSectionNum:section];
        [vc setDic:dic];
        [vc setAnswers:[[NSMutableString alloc] initWithString:answers]];
    } else if ([[segue identifier] isEqualToString:@"toSectionThree"]) {
        EmptyQuestionViewController *vc = [segue destinationViewController];
        [vc setSection:[[NSArray alloc] initWithArray:[dic objectForKey:@"QuestionsAndAnswers"]]];
        [vc setSectionNum:section];
        [vc setDic:dic];
        [vc setAnswers:[[NSMutableString alloc] initWithString:answers]];
    } else if ([[segue identifier] isEqualToString:@"toSectionFour"]) {
        QuestionsAnswersViewController *vc = [segue destinationViewController];
        [vc setSection:[[NSArray alloc] initWithArray:[dic objectForKey:@"QuestionsAndAnswers"]]];
        [vc setSectionNum:section];
        [vc setDic:dic];
        [vc setAnswers:[[NSMutableString alloc] initWithString:answers]];
    } else if ([[segue identifier] isEqualToString:@"toSectionFive"]) {
        QuestionsAnswersViewController *vc = [segue destinationViewController];
        [vc setSection:[[NSArray alloc] initWithArray:[dic objectForKey:@"QuestionsAndAnswers"]]];
        [vc setSectionNum:section];
        [vc setDic:dic];
        [vc setAnswers:[[NSMutableString alloc] initWithString:answers]];
    }
}

- (IBAction)nextQuestions:(id)sender {
    if (section == 0) {
        [self performSegueWithIdentifier:@"toSectionOne" sender:self];
    } else if (section == 1) {
        [self performSegueWithIdentifier:@"toSectionTwo" sender:self];
    } else if (section == 2) {
        [self performSegueWithIdentifier:@"toSectionThree" sender:self];
    } else if (section == 3) {
        [self performSegueWithIdentifier:@"toSectionFour" sender:self];
    } else if (section == 4) {
        [self performSegueWithIdentifier:@"toSectionFive" sender:self];
    }
}

@end
