//
//  PAPHomeViewController.h
//  StrictlySelfies
//

#import "PAPPhotoTimelineViewController.h"

@interface PAPHomeViewController : PAPPhotoTimelineViewController

@property (nonatomic, assign, getter = isFirstLaunch) BOOL firstLaunch;

@end
