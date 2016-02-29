#import <UIKit/UIKit.h>

@interface Votacao : UIViewController

@property (nonatomic) IBOutlet UIView* viewFundo;
@property (weak, nonatomic) IBOutlet UILabel *txtLabel;
@property (nonatomic) IBOutlet UIImageView* fundo;
@property (nonatomic) IBOutlet UIButton* opcao1;
@property (nonatomic) IBOutlet UIButton* opcao2;
@property (nonatomic) IBOutlet UIButton* opcao3;
@property (nonatomic) IBOutlet UIButton* confirma;
@property (nonatomic) IBOutlet UIButton* cancela;
@property (nonatomic) IBOutlet UIImageView* badgeDoacao;
@property (nonatomic) IBOutlet UIImageView* badgeVoto;
@property (nonatomic) IBOutlet UIButton* botaoVoltar;
@property (nonatomic) IBOutlet UIButton* botaoSom;
@property (weak, nonatomic) IBOutlet UIImageView *btn1SelectedBorder;
@property (weak, nonatomic) IBOutlet UIImageView *btn2SelectedBorder;
@property (weak, nonatomic) IBOutlet UIImageView *btn3SelectedBorder;
@property (strong, nonatomic) UIViewController *popUpView;

@end
