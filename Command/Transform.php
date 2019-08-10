<?php

declare(strict_types=1);

namespace DavidWeichert\XsltTutorial;


use DOMDocument;
use RuntimeException;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use XSLTProcessor;

class Transform extends Command
{
    protected function configure()
    {
        $this
            ->setName('xslt:transform')
            ->setDescription('Transforms input XML using specified XSLT stylesheet')
            ->addArgument('source', InputArgument::REQUIRED, 'Source XML file')
            ->addArgument('stylesheet', InputArgument::REQUIRED, 'XSLT stylesheet')
            ->addArgument('output', InputArgument::OPTIONAL, 'Output file');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        if (!extension_loaded('dom')) {
            throw new RuntimeException('PHP DOM extension must be loaded.');
        }
        if (!extension_loaded('xsl')) {
            throw new RuntimeException('PHP XSL extension must be loaded.');
        }
        $proc = new XSLTProcessor();
        $proc->importStylesheet($this->getStylesheet($input));
        $result = $proc->transformToXml($this->getSource($input));

        $output = $input->getArgument('output');
        if(is_null($output)) {
            echo $result;
        } else {
            file_put_contents($output, $result);
        }

    }

    private function getSource(InputInterface $input): DOMDocument
    {
        $source = $input->getArgument('source');
        if (!file_exists($source)) {
            throw new RuntimeException(sprintf('Source file "%s" not found.', $source));
        }
        $xml = new DOMDocument();
        $xml->load($source);

        return $xml;
    }

    private function getStylesheet(InputInterface $input): DOMDocument
    {
        $stylesheet = $input->getArgument('stylesheet');
        if (!file_exists($stylesheet)) {
            throw new RuntimeException(sprintf('XSLT stylesheet file "%s" not found.', $stylesheet));
        }
        $xml = new DOMDocument();
        $xml->load($stylesheet);

        return $xml;
    }
}
