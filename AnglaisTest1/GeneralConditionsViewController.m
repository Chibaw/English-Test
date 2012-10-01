/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import "GeneralConditionsViewController.h"
#import "QuestionsAnswersInfoViewController.h"

@interface GeneralConditionsViewController ()

@end

@implementation GeneralConditionsViewController
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
    [self setValidationChecker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"StartToeic"])
    {
        QuestionsAnswersInfoViewController *infoViewController = [segue destinationViewController];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"questions_and_answers" ofType:@"plist"];
        //sectionsArray = [[NSArray alloc] initWithArray:[dic objectForKey:@"QuestionsAndAnswers"]];
        [infoViewController setDic:[[NSDictionary alloc] initWithContentsOfFile:path]];
        [infoViewController setSection:0];
        [infoViewController setAnswers:[[NSMutableString alloc] initWithString:@""]];
    }
}

- (IBAction)startToeic:(id)sender {
    if (self.validationChecker.on == TRUE) {
        [self performSegueWithIdentifier:@"StartToeic" sender:self];
    }
}

@end
