/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import "QuestionsAnswersInfoViewController.h"
#import "ImageSoundViewController.h"
#import "QuestionsAnswersViewController.h"
#import "EmptyQuestionViewController.h"
#import "FinalQuestionsViewController.h"

@interface QuestionsAnswersInfoViewController ()

@end

@implementation QuestionsAnswersInfoViewController
@synthesize validationChecker;
@synthesize infoSection;
@synthesize dic;
@synthesize section;
@synthesize answers;
@synthesize startDate;

@synthesize name;
@synthesize lastName;
@synthesize mail;

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
    NSLog(@"%@",[startDate description]);
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
        [vc setName:[[NSString alloc] initWithString:name]];
        [vc setLastName:[[NSString alloc] initWithString:lastName]];
        [vc setMail:[[NSString alloc] initWithString:mail]];
        [vc setStartDate:startDate];
    } else if ([[segue identifier] isEqualToString:@"toSectionTwo"]) {
        QuestionsAnswersViewController *vc = [segue destinationViewController];
        [vc setSection:[[NSArray alloc] initWithArray:[dic objectForKey:@"QuestionsAndAnswers"]]];
        [vc setSectionNum:section];
        [vc setDic:dic];
        [vc setAnswers:[[NSMutableString alloc] initWithString:answers]];
        [vc setName:[[NSString alloc] initWithString:name]];
        [vc setLastName:[[NSString alloc] initWithString:lastName]];
        [vc setMail:[[NSString alloc] initWithString:mail]];
        [vc setStartDate:startDate];
    } else if ([[segue identifier] isEqualToString:@"toSectionThree"]) {
        EmptyQuestionViewController *vc = [segue destinationViewController];
        [vc setSection:[[NSArray alloc] initWithArray:[dic objectForKey:@"QuestionsAndAnswers"]]];
        [vc setSectionNum:section];
        [vc setDic:dic];
        [vc setAnswers:[[NSMutableString alloc] initWithString:answers]];
        [vc setName:[[NSString alloc] initWithString:name]];
        [vc setLastName:[[NSString alloc] initWithString:lastName]];
        [vc setMail:[[NSString alloc] initWithString:mail]];
        [vc setStartDate:startDate];
    } else if ([[segue identifier] isEqualToString:@"toSectionFour"]) {
        FinalQuestionsViewController *vc = [segue destinationViewController];
        [vc setSection:[[NSArray alloc] initWithArray:[dic objectForKey:@"QuestionsAndAnswers"]]];
        [vc setSectionNum:section];
        [vc setDic:dic];
        [vc setAnswers:[[NSMutableString alloc] initWithString:answers]];
        [vc setName:[[NSMutableString alloc] initWithString:name]];
        [vc setLastName:[[NSMutableString alloc] initWithString:lastName]];
        [vc setMail:[[NSMutableString alloc] initWithString:mail]];
        [vc setStartDate:startDate];
    } else if ([[segue identifier] isEqualToString:@"toSectionFive"]) {
        FinalQuestionsViewController *vc = [segue destinationViewController];
        [vc setSection:[[NSArray alloc] initWithArray:[dic objectForKey:@"QuestionsAndAnswers"]]];
        [vc setSectionNum:section];
        [vc setDic:dic];
        [vc setAnswers:[[NSMutableString alloc] initWithString:answers]];
        [vc setName:[[NSMutableString alloc] initWithString:name]];
        [vc setLastName:[[NSMutableString alloc] initWithString:lastName]];
        [vc setMail:[[NSMutableString alloc] initWithString:mail]];
        [vc setStartDate:startDate];
    }
}

- (IBAction)nextQuestions:(id)sender {
    NSLog(@"%@", name);
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
