//
//  ShareTableViewController.h
//  StrictlySelfies
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ShareTableViewController : UITableViewController <UIDocumentInteractionControllerDelegate, MFMessageComposeViewControllerDelegate>

@property (strong, nonatomic) UIDocumentInteractionController *documentInteractionController;

@end
