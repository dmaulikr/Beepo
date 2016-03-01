#import "InfoViewController.h"
#import "ParentsViewController.h"
#import "ExtrasViewController.h"

@interface InfoViewController () <ParentsViewControllerDelegate, ExtrasViewControllerDelegate>

@property (nonatomic, weak) ParentsViewController *parentsViewController;
@property (nonatomic, weak) ExtrasViewController *extraViewController;

@end

@implementation InfoViewController

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
        _parentsViewController = segue.destinationViewController;
        _parentsViewController.delegate = self;
    } else if ([segue.identifier isEqualToString:@"extrasSegue"]){
        _extraViewController = segue.destinationViewController;
        _extraViewController.delegate = self;
    }
}

- (void) askedToDismissExtra{
    [_extraViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void) askedToDismissParents{
    [_parentsViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void) askedToDismissInfo{
    if ([_delegate respondsToSelector:@selector(askedToDismissInfo)]) {
        [_delegate askedToDismissInfo];
    }
}

@end
