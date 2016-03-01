#import <UIKit/UIKit.h>

@protocol SecondStoryViewControllerDelegate <NSObject>

- (void) askedToDismissSecondStory;

@end

@interface SecondStoryViewController : UIViewController

@property (nonatomic, assign) id <SecondStoryViewControllerDelegate> delegate;

@end
