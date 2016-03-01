#import <UIKit/UIKit.h>

@protocol PhasesViewControllerDelegate <NSObject>

- (void) askedToDismissPhases;

@end

@interface PhasesViewController : UIViewController

@property (nonatomic, assign) id <PhasesViewControllerDelegate> delegate;

@end
