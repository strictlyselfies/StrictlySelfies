//
//  PAPFindFriendsViewController.h
//  StrictlySelfies
//

#import <AddressBookUI/AddressBookUI.h>
#import <MessageUI/MessageUI.h>
#import "PAPFindFriendsCell.h"

@interface PAPFindFriendsViewController : PFQueryTableViewController <PAPFindFriendsCellDelegate, ABPeoplePickerNavigationControllerDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate, UIActionSheetDelegate, UIAlertViewDelegate>



@end
