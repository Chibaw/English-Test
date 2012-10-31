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
@synthesize player;

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
    NSString        *path = [[NSBundle mainBundle]
                             pathForResource:@"test_son.mp3" ofType:nil];
    NSURL           *url = [[NSURL alloc] initFileURLWithPath:path];
    player = [[AVAudioPlayer alloc]
              initWithContentsOfURL:url error:nil];
    [player prepareToPlay];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [player stop];
    [self setPlayer:nil];
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
        [infoViewController setName:name];
        [infoViewController setLastName:lastName];
        [infoViewController setMail:mail];
        [infoViewController setStartDate:[[NSDate alloc] init]];
    }
}

- (IBAction)startToeic:(id)sender {
    if (self.validationChecker.on == TRUE) {
        [player stop];
        [self performSegueWithIdentifier:@"StartToeic" sender:self];
    }
}

- (IBAction)SoundText:(id)sender {
    if (player != nil){
        if ([player isPlaying] == YES) {
            [player stop];
        } else {
            [player play];
        }
    }
}

@end
