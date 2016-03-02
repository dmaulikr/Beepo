#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol PopUpViewControllerDelegate <NSObject>

- (void) askedToDismissPopUp;

@end

@interface PopUpViewController : UIViewController

@property (nonatomic, assign) id <PopUpViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIView *popUpView;
@property (weak, nonatomic) IBOutlet UIImageView *badgeImageView;

- (void)showInView:(UIView *)aView animated:(BOOL)animated;

- (void)setImageNamed:(NSString *)imageName;

@end
