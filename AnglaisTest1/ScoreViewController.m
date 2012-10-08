/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import "ScoreViewController.h"
//#import "SKPSMTPMessage.h"
@interface ScoreViewController ()

@end

@implementation ScoreViewController
@synthesize answers;
@synthesize scoreBox;
@synthesize verify;
@synthesize catSizes;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)getSectionsSizes
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"questions_and_answers" ofType:@"plist"];
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *sectionsArray = [[NSArray alloc] initWithArray:[dic objectForKey:@"QuestionsAndAnswers"]];
    verify = [[NSMutableString alloc] initWithString:@""];
    catSizes = [[NSMutableArray alloc] init];
    for (int i = 0; i < [sectionsArray count]; ++i) {
        [catSizes addObject:[NSNumber numberWithInteger:[sectionsArray[i] count]]];
        for (int j = 0; j < [sectionsArray[i] count]; ++j) {
            NSDictionary *lol = sectionsArray[i][j];
            [verify appendString:[lol valueForKey:@"answer"]];
        }
    }
//    NSLog(@"%@", answers);
//    NSLog(@"%@", verify);
//    NSLog(@"%@", catSizes);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getSectionsSizes];
    const char *yay = [answers UTF8String];
    const char *yayVerified = [verify UTF8String];
    int score = 0;
    for (int i = 0; i < [answers length]; ++i) {
        if (yay[i] == yayVerified[i]) {
            ++score;
        }
    }
    int finalScore = ((990*score/[answers length]) - (990*score/[answers length])%5);
    [scoreBox setText:[NSString stringWithFormat:@"%d", finalScore]];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setScoreBox:nil];
    [super viewDidUnload];
}

- (IBAction)goodBye:(id)sender {
    exit(EXIT_SUCCESS);
}

//-(void)sendEmail {
//    //the guts of the message.
//    SKPSMTPMessage *testMsg = [[SKPSMTPMessage alloc] init];
//    testMsg.fromEmail = @"ipad.epitech.mpl@gmail.com";
//    testMsg.toEmail = @"julien.bordellier@epitech.eu";
//    testMsg.relayHost = @"smtp.gmail.com";
//    testMsg.requiresAuth = YES;
//    testMsg.login = @"ipad.epitech.mpl@gmail.com";
//    testMsg.pass = @"toto42sh";
//    testMsg.subject = @"This is the email subject line";
//    testMsg.wantsSecure = YES; // smtp.gmail.com doesn't work without TLS!
//    
//    
//    
//    // Only do this for self-signed certs!
//    // testMsg.validateSSLChain = NO;
//    //testMsg.delegate = self;
//    
//    //email contents
//    NSString * bodyMessage = [NSString stringWithFormat:@"This is the body of the email. You can put anything in here that you want."];
//    
//    
//    NSDictionary *plainPart = [NSDictionary dictionaryWithObjectsAndKeys:@"text/plain",kSKPSMTPPartContentTypeKey,
//                               bodyMessage ,kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];
//    
//    testMsg.parts = [NSArray arrayWithObjects:plainPart,nil];
//    
//    [testMsg send];
//    
//}

//- (void)messageSent:(SKPSMTPMessage *)message
//{
//    [message release];
//    
//    //message has been successfully sent . you can notify the user of that and remove the wait overlay
//    [self removeWaitOverlay];
//    
//    
//    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message Sent" message:@"Thanks, we have sent your message"
//                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
//    [alert show];
//    [alert release];
//}
//
//- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error
//{
//    [message release];
//    
//    NSLog(@"delegate - error(%d): %@", [error code], [error localizedDescription]);
//    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Error" message:@"Sending Failed - Unknown Error :-("
//                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
//    [alert show];
//    [alert release];
//}

@end
