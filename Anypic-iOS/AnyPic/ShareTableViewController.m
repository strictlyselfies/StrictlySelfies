//
//  ShareTableViewController.m
//  StrictlySelfies
//
//  Created by Jeffrey Jackson on 2/10/15.
//
//

#import "ShareTableViewController.h"
#import <Social/Social.h>

@interface ShareTableViewController ()

@end

@implementation ShareTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"JOIN ME";
    [self.tableView setBackgroundColor:[[UIColor colorWithRed:0.08 green:0.38 blue:0.88 alpha:1] colorWithAlphaComponent:.7]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"SHARE"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (self.view.frame.size.height) / 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SHARE" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SHARE"];
    }
    
    if (indexPath.row == 0) {
        UILabel *textLabel = [[UILabel alloc] init];
        [textLabel setFrame:CGRectMake(((self.view.frame.size.height) / 3), ((self.view.frame.size.height) / 3)/2 - 20, self.view.frame.size.width - ((self.view.frame.size.height) / 3), 40)];
        [textLabel setText:@"FACEBOOK"];
        [textLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25.0f]];
        [textLabel setTextColor:[UIColor whiteColor]];
        [cell addSubview:textLabel];
        
        [cell setBackgroundColor:[UIColor colorWithRed:0.3 green:0.41 blue:0.62 alpha:1]];
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"facebook"]];
        [image setFrame:CGRectMake(10, 10, ((self.view.frame.size.height) / 3) - 20, ((self.view.frame.size.height) / 3) - 20)];
        [cell addSubview:image];
    } else if (indexPath.row == 1) {
        UILabel *textLabel = [[UILabel alloc] init];
        [textLabel setFrame:CGRectMake(((self.view.frame.size.height) / 3), ((self.view.frame.size.height) / 3)/2 - 20, self.view.frame.size.width - ((self.view.frame.size.height) / 3), 40)];
        [textLabel setText:@"INSTAGRAM"];
        [textLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25.0f]];
        [textLabel setTextColor:[UIColor whiteColor]];
        [cell addSubview:textLabel];
        
        [cell setBackgroundColor:[UIColor colorWithRed:0.62 green:0.41 blue:0.33 alpha:1]];
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"instagram"]];
        [image setFrame:CGRectMake(10, 10, ((self.view.frame.size.height) / 3) - 20, ((self.view.frame.size.height) / 3) - 20)];
        [cell addSubview:image];
    } else if (indexPath.row == 2) {
        UILabel *textLabel = [[UILabel alloc] init];
        [textLabel setFrame:CGRectMake(((self.view.frame.size.height) / 3), ((self.view.frame.size.height) / 3)/2 - 20, self.view.frame.size.width - ((self.view.frame.size.height) / 3), 40)];
        [textLabel setText:@"TWITTER"];
        [textLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25.0f]];
        [textLabel setTextColor:[UIColor whiteColor]];
        [cell addSubview:textLabel];
        
        [cell setBackgroundColor:[UIColor colorWithRed:0.35 green:0.68 blue:0.92 alpha:1]];
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"twitter"]];
        [image setFrame:CGRectMake(10, 10, ((self.view.frame.size.height) / 3) - 20, ((self.view.frame.size.height) / 3) - 20)];
        [cell addSubview:image];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
            SLComposeViewController *facebookSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            [facebookSheet addImage:[UIImage imageNamed:@"1024"]];
            [facebookSheet setInitialText:@"Join me on strictly selfies!"];
            [facebookSheet addURL:[NSURL URLWithString:@"http://bit.ly/strictlyselfies"]];
            [self presentViewController:facebookSheet animated:YES completion:nil];
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"INSTALL FACEBOOK" message:@"Please make sure you have the facebook app installed and a user signed in to use this feature" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction
                                          actionWithTitle:@"OK"
                                          style:UIAlertActionStyleDefault
                                          handler:^(UIAlertAction * action)
                                          {
                                              [alert dismissViewControllerAnimated:YES completion:nil];
                                          }];
            [alert addAction:alertAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    } else if (indexPath.row == 1) {
        NSArray *cachePathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *cachePath = [cachePathArray lastObject];
        UIImage *image = [UIImage imageNamed:@"1024"];
        NSData *imageData = UIImageJPEGRepresentation(image, 1.0f);
        NSString *filename = [NSString stringWithFormat:@"%.estrict.igo", [[NSDate date] timeIntervalSince1970]];
        NSString *filePath = [cachePath stringByAppendingPathComponent:filename];
        
        if (![imageData writeToFile:filePath atomically:YES]) {
            [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Oops", @"error alert title")
                                        message:NSLocalizedString(@"There was a problem saving your image",
                                                                  @"error message if image saving fails")
                                       delegate:nil
                              cancelButtonTitle:NSLocalizedString(@"Okay", @"dismiss alert dialog button")
                              otherButtonTitles:nil] show];
        }
        
        
        NSURL *url = [NSURL fileURLWithPath:filePath];
        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:url];
        
        NSString *caption = [NSString stringWithFormat:@"Join me on strictly selfies!  Download the app from the App Store!"];
        
        self.documentInteractionController.annotation = [NSDictionary dictionaryWithObject:caption forKey:@"InstagramCaption"];
        self.documentInteractionController.delegate = self;
        self.documentInteractionController.UTI = @"com.instagram.exclusivegram";
        
        if (![self.documentInteractionController presentOpenInMenuFromRect:CGRectMake(0, self.view.frame.size.height - self.tabBarController.tabBar.frame.size.height, 0, 0)
                                                                    inView:self.view
                                                                  animated:YES]) {
            [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Install Instagram", @"error alert title")
                                        message:NSLocalizedString(@"No compatible instagram application could be found.",
                                                                  @"error if instagram isn't found on device")
                                       delegate:nil
                              cancelButtonTitle:NSLocalizedString(@"Okay", @"dismiss alert button title")
                              otherButtonTitles:nil] show];
        }
    } else if (indexPath.row == 2) {
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
            SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            [tweetSheet setInitialText:@"Join me on strictly selfies!"];
            [tweetSheet addURL:[NSURL URLWithString:@"http://bit.ly/strictlyselfies"]];
            [tweetSheet addImage:[UIImage imageNamed:@"1024"]];
            [self presentViewController:tweetSheet animated:YES completion:nil];
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"INSTALL TWITTER" message:@"Please make sure you have the twitter app installed and a user signed in to use this feature" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction
                                          actionWithTitle:@"OK"
                                          style:UIAlertActionStyleDefault
                                          handler:^(UIAlertAction * action)
                                          {
                                              [alert dismissViewControllerAnimated:YES completion:nil];
                                          }];
            [alert addAction:alertAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
