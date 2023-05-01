#import "SettingController.h"

@implementation SettingController
- (void)viewDidLoad {
    [super viewDidLoad];
    [CTHSocial loginFaceBook:self];
    [self loadData];
}
-(void)viewDidDisappear:(BOOL)animated{
}
-(void)loadData{
    
}

-(void)reloadTable{
    [self performSelector:@selector(waitLoadData) withObject:nil afterDelay:0.01];
}
-(void)waitLoadData{
    [self doneLoadingTableViewData];
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark Table view methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

@end
