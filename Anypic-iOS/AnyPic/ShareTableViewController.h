//
//  ShareTableViewController.h
//  StrictlySelfies
//
//  Created by Jeffrey Jackson on 2/10/15.
//
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ShareTableViewController : UITableViewController <UIDocumentInteractionControllerDelegate, MFMessageComposeViewControllerDelegate>

@property (strong, nonatomic) UIDocumentInteractionController *documentInteractionController;

@end
