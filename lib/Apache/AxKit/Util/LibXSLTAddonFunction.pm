package Apache::AxKit::Util::LibXSLTAddonFunction;

use strict;

sub new {
    my $class = shift;
    
    my $this = [ [ ] ];
    
    bless $this, $class;
    
    $this->init();
    
    return $this;
}

sub init {
    die "has to be implemened by derived class\n";
}

sub addRegisteredFunction {
    push @{ $_[0]->[0] }, [ $_[1], $_[2] ];
}

sub getNamespace {
    die "has to be implemented by derived class\n";
}

sub getFunctions {
    return @{ $_[0][0] };
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Apache::AxKit::Util::LibXSLTAddonFunction - AxKit extension to load perl callbacks for XSL

=head1 SYNOPSIS
  package Apache::AxKit::Util::MiscAddonFunctions;

  use base qw( Apache::AxKit::Util::LibXSLTAddonFunction );
  use strict;
  use XML::LibXML;
         
  my $parser = XML::LibXML->new();

  sub init {
      my $this = shift;
    
      $this->addRegisteredFunction( "createXMLTreeFromEscapedTags", \&createXMLTreeFromEscapedTags );
  }

  sub getNamespace {
      return "urn:perl-misc-addon";
  }

  sub createXMLTreeFromEscapedTags {
      my $val  = shift;

      $val =~ s/<\s+/&lt;/;
    
      my $doc = $parser->parse_string(<<"EOT");
  <tree>
  $val
  </tree>
  EOT
      return $doc->getElementsByTagName("tree");
  }

  1;

=head1 DESCRIPTION

This is an abstract base class. Classes used by Apache::AxKit::Language::LibXSLTEnhanced must inherit
from this class and implement the following 2 methods:

=over
    
=item * init
    
=item * getNamespace
    
=back

=head2 EXPORT

None by default.

=head1 SEE ALSO

L<Apache::AxKit::Language::LibXSLT>, L<AxKit>, L<Apache::AxKit::Language::LibXSLTEnhanced>

=head1 AUTHOR

Tom Schindl, E<lt>tom.schindl@bestsolution.atE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2004 by Tom Schindl

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.3 or,
at your option, any later version of Perl 5 you may have available.


=cut
