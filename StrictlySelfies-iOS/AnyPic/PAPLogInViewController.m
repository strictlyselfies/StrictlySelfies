//
//  PAPLogInViewController.m
//  StrictlySelfies
//

#import "PAPLogInViewController.h"

@implementation PAPLogInViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // There is no documentation on how to handle assets with the taller iPhone 5 screen as of 9/13/2012
    if ([UIScreen mainScreen].bounds.size.height > 480.0f) {
        // for the iPhone 5
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundLogin-568h.png"]];
    } else {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundLogin.png"]];
    }
    
    NSString *text = NSLocalizedString(@"Sign up and start sharing selfies with your friends.", @"Sign up and start sharing selfies with your friends.");

    CGSize textSize = [text boundingRectWithSize:CGSizeMake(255.0f, CGFLOAT_MAX)
                                                    options:NSStringDrawingUsesLineFragmentOrigin // wordwrap?
                                                 attributes:@{NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0f]}
                                                    context:nil].size;
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake( ([UIScreen mainScreen].bounds.size.width - textSize.width)/2.0f, 160.0f, textSize.width, textSize.height)];
    [textLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0f]];
    [textLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [textLabel setNumberOfLines:0];
    [textLabel setText:text];
    [textLabel setTextColor:[UIColor  whiteColor]];
    [textLabel setBackgroundColor:[UIColor clearColor]];
    [textLabel setTextAlignment:NSTextAlignmentCenter];
    [self.logInView addSubview:textLabel];
    
    [self.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LogoNavigationBar"]]];
    
    UILabel *eula = [[UILabel alloc] initWithFrame:CGRectMake( ([UIScreen mainScreen].bounds.size.width - textSize.width)/2.0f, 300.0f, textSize.width, textSize.height)];
    [eula setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:5.0f]];
    [eula setLineBreakMode:NSLineBreakByWordWrapping];
    [eula setNumberOfLines:5];
    [eula setText:@"By signing up you agree to the EULA. Any and all objectionable content will not be tolerated and will cause user account to be suspended from StrictlySelfies"];
    [eula setTextColor:[UIColor  whiteColor]];
    [eula setBackgroundColor:[UIColor clearColor]];
    [eula setTextAlignment:NSTextAlignmentCenter];
    [self.logInView addSubview:eula];
    
    self.fields = PFLogInFieldsUsernameAndPassword;
    self.logInView.usernameField.placeholder = @"Enter your email";
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return toInterfaceOrientation == UIInterfaceOrientationPortrait;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
