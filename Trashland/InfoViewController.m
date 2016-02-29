#import "InfoViewController.h"
#import "ParentsViewController.h"

@interface InfoViewController () <ParentsViewControllerDelegate>

@property (nonatomic, weak) ParentsViewController *vc;

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didTappedBackButton:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTappedParentsButton:(id)sender{
    [self performSegueWithIdentifier:@"parentsSegue" sender:self];
}

- (IBAction)didTappedExtraButton:(id)sender{
    [self performSegueWithIdentifier:@"extrasSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"parentsSegue"]) {
        self.vc = segue.destinationViewController;
        self.vc.delegate = self;
    }
}

- (void) askedToDismiss{
    [self.vc dismissViewControllerAnimated:YES completion:nil];
}

@end
