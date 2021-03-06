use Test::More;
use lib 'lib';
use Period;
use Data::Dumper;

my $p = Period->new;
my $context = Period::Context->new;

{
    my $e = $p->parse(<<"TEST");
p = [2013-12-12,2013-12-31];
q = [2013-12-01,2013-12-31];
p finishes q;
TEST
    my $names = {};
    ok($e->evaluate({}, $context));
}

{
    my $e = $p->parse(<<"TEST");
p = [2013-12-12,2013-12-31];
q = [2013-12-01,2013-12-31];
!p starts q;
TEST
    my $names = {};
    ok($e->evaluate({}, $context));
}

{
    my $e = $p->parse(<<"TEST");
p = [2013-12-12,2013-12-31];
q = [2013-12-01,2014-01-01];
!p finishes q;
TEST
    my $names = {};
    ok($e->evaluate({}, $context));
}

done_testing();

