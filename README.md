# XSLT Tutorial

## Install dependencies

    composer install
    
## Usage

    ./bin/console xslt:transform ./examples/foo.xml ./examples/foo.xsl
    
Optional output to file

    ./bin/console xslt:transform ./examples/foo.xml ./examples/foo.xsl ./examples/out.xml