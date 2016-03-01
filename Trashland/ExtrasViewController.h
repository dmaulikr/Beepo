#import <UIKit/UIKit.h>

@protocol ExtrasViewControllerDelegate <NSObject>

- (void) askedToDismissExtra;

@end

@interface ExtrasViewController : UIViewController

@property (nonatomic, assign) id <ExtrasViewControllerDelegate> delegate;

@end
