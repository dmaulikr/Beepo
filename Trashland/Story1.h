#import <UIKit/UIKit.h>
#import "Player.h"

@interface Story1 : UIViewController

@property (weak, nonatomic) IBOutlet UIPageControl* controle;
@property (weak, nonatomic) IBOutlet UIImageView *gifDedo;
@property (weak, nonatomic) IBOutlet UIImageView *telaUm;
@property (weak, nonatomic) IBOutlet UIImageView *telaDois;
@property (retain, nonatomic) Player* player;
@property (weak, nonatomic) IBOutlet UIImageView *telaTres;

@property (nonatomic) IBOutlet UIButton *buttonNarrar;

@end
