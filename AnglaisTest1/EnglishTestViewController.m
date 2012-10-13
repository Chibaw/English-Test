/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import "EnglishTestViewController.h"
#import "GeneralConditionsViewController.h"

@interface EnglishTestViewController ()

@end

@implementation EnglishTestViewController
@synthesize textFieldMail;
@synthesize textFieldLastName;
@synthesize textFieldFirstName;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"ipad2.png"]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setTextFieldMail:nil];
    [self setTextFieldLastName:nil];
    [self setTextFieldFirstName:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation);
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.textFieldMail) {
        [theTextField resignFirstResponder];
    } else if (theTextField == self.textFieldLastName) {
        [self.textFieldFirstName becomeFirstResponder];
    } else if (theTextField == self.textFieldFirstName) {
        [self.textFieldMail becomeFirstResponder];
    }
    return NO;
}

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (BOOL)ValidationSuccessful {
    if ([self.textFieldFirstName.text compare:@""]
        && [self.textFieldLastName.text compare:@""]
        && [self.textFieldMail.text compare:@""]
        && [self NSStringIsValidEmail:self.textFieldMail.text]) {
      return TRUE;
    }
    return FALSE;
}

- (BOOL)isAdminInUserDatabase {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"users" ofType:@"plist"];

    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *array = [NSArray alloc];
    array = [dic objectForKey:@"Users"];

    NSUInteger count = [array count];
    for (NSUInteger index = 0; index < count; index++)
    {  
        if ([[[array objectAtIndex: index] objectForKey: @"lastName"] isEqualToString: self.textFieldLastName.text]
            && [[[array objectAtIndex: index] objectForKey: @"firstName"] isEqualToString: self.textFieldFirstName.text]
            && [[[array objectAtIndex: index] objectForKey: @"mail"] isEqualToString: self.textFieldMail.text])
        {
            return TRUE;
        }
    }
    return FALSE;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ValidationSucceeded"])
    {
        GeneralConditionsViewController *generalConditions = [segue destinationViewController];
        [generalConditions setName:textFieldFirstName.text];
        [generalConditions setLastName:textFieldLastName.text];
        [generalConditions setMail:textFieldMail.text];
    }
}

- (IBAction)buttonStart:(id)sender {
    
    if ([self ValidationSuccessful] == YES) {
        if ([self isAdminInUserDatabase]) {
            [self performSegueWithIdentifier:@"ValidationSucceededAdmin" sender:self];            
        } else {
            [self performSegueWithIdentifier:@"ValidationSucceeded" sender:self];
        }
    }
}
@end
