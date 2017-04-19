package Perl::Druid::Filter::LogicalFilter;
use Moo;

extends 'Perl::Druid::Filter';

has fields	=> (is => 'ro', default => sub { [] });

sub build {
	my $self = shift;
	
	my $filter = {
		'type' 		=> $self->type,
		'fields'	=> []
	};

	map { 
		push @{$filter->{'fields'}}, $_->build;
	}  @{$self->fields};
	
	return $filter;
}

1;

