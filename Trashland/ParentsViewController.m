#import "ParentsViewController.h"

@interface ParentsViewController ()

@end

@implementation ParentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didTappedBackButton:(id)sender{
    if ([_delegate respondsToSelector:@selector(askedToDismiss)]) {
        [_delegate askedToDismiss];
    }
}

@end
